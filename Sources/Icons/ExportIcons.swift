//
//  File.swift
//  
//
//  Created by Sashen Singh on 01/11/2024.
//

import Foundation
import ArgumentParser

struct ExportIcons: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "icons",
        abstract: "Exports icons from Figma",
        discussion: "Exports icons from Figma to Xcode ")

    @OptionGroup
    var configuration: Configuration

    static let fileWriter = FileWriter()
    static let fileDownloader = FileDownloader()

    func run() throws {
        let client = FigmaClient(accessToken: configuration.accessToken, timeout: configuration.params.figma.timeout)

        if let params = configuration.params,
           let ios = params.ios,
           let iconsParams = params.ios?.icons {
            let loader = ImagesLoader(client: client, params: params, platform: .ios)
            let imagesTuple = try loader.loadIcons()

            let processor = ImagesProcessor(
                platform: .ios,
                nameValidateRegexp: params.common?.icons?.nameValidateRegexp,
                nameReplaceRegexp: params.common?.icons?.nameReplaceRegexp,
                nameStyle: nil
            )

            let icons = processor.process(light: imagesTuple.light, dark: imagesTuple.dark)

            let assetsURL = ios.xcassetsPath.appendingPathComponent(iconsParams.assetsFolder)

            let output = XcodeImagesOutput(
                assetsFolderURL: assetsURL,
                assetsInMainBundle: ios.xcassetsInMainBundle,
                assetsInSwiftPackage: ios.xcassetsInSwiftPackage,
                resourceBundleNames: ios.resourceBundleNames,
                addObjcAttribute: ios.addObjcAttribute,
                preservesVectorRepresentation: iconsParams.preservesVectorRepresentation,
                uiKitImageExtensionURL: iconsParams.imageSwift,
                swiftUIImageExtensionURL: iconsParams.swiftUIImageSwift,
                templatesPath: ios.templatesPath)

            let exporter = XcodeIconsExporter(output: output)

            let localAndRemoteFiles = try exporter.export(icons: icons.get(), append: false)

            try? FileManager.default.removeItem(atPath: assetsURL.path)

            let localFiles = try ExportIcons.fileDownloader.fetch(files: localAndRemoteFiles)

            try ExportIcons.fileWriter.write(files: localFiles)
        }
    }
}
