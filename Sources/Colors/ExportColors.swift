//
//  ExportColors.swift
//
//
//  Created by Sashen Singh on 30/09/2024.
//

import Foundation
import ArgumentParser

struct ExportVariableColors: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "variableColors",
        abstract: "Exports colors from Figma",
        discussion: "Exports light and dark color palette from Figma to Xcode / Android Studio project")

    @OptionGroup
    var configuration: Configuration

    static let fileWriter = FileWriter()

    func run() throws {
        let client = FigmaClient(accessToken: configuration.accessToken, timeout: configuration.params.figma.timeout)
        let figmaParams = configuration.params.figma

        let loader = ColorsVariablesLoader(
            client: client,
            figmaParams: figmaParams,
            variableParams: configuration.params.common?.variablesColors,
            filter: nil
        )

        let colors: ColorsLoaderOutput = try loader.load()

        let processor = ColorsProcessor(nameValidateRegexp: nil,
                                        nameReplaceRegexp: nil,
                                        nameStyle: nil)

        let colorPairs = processor.process(light: colors.light,
                                           dark: colors.dark,
                                           lightHC: colors.lightHC,
                                           darkHC: colors.darkHC)

        guard let params = configuration.params.ios else { return }

        try exportXcodeColors(colorPairs: colorPairs.get(), iosParams: params)
    }

    private func exportXcodeColors(colorPairs: [AssetPair<Color>], iosParams: Params.iOS) throws {
        guard let colorParams = iosParams.colors else {
            fatalError("Nothing to do. Add ios.colors parameters to the config file.")
        }

        var colorsURL: URL?
        if colorParams.useColorAssets {
            if let folder = colorParams.assetsFolder {
                colorsURL = iosParams.xcassetsPath.appendingPathComponent(folder)
            } else {
                fatalError("colorsAssetsFolderNotSpecified")
            }
        }

        let output = XcodeColorsOutput(
            assetsColorsURL: colorsURL,
            assetsInMainBundle: iosParams.xcassetsInMainBundle,
            assetsInSwiftPackage: iosParams.xcassetsInSwiftPackage,
            resourceBundleNames: iosParams.resourceBundleNames,
            addObjcAttribute: iosParams.addObjcAttribute,
            colorSwiftURL: colorParams.colorSwift,
            swiftuiColorSwiftURL: colorParams.swiftuiColorSwift,
            groupUsingNamespace: colorParams.groupUsingNamespace,
            templatesPath: iosParams.templatesPath
        )

        let exporter = XcodeColorExporter(output: output)
        let files = try exporter.export(colorPairs: colorPairs)

        try ExportVariableColors.fileWriter.write(files: files)
    }
}

