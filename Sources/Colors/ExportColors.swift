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

    func run() throws {
        let client = FigmaClient(accessToken: configuration.accessToken, timeout: configuration.params.figma.timeout)
        let figmaParams = configuration.params.figma

        let loader = ColorsVariablesLoader(
            client: client,
            figmaParams: figmaParams,
            variableParams: configuration.params.common?.variablesColors,
            filter: nil
        )

        var colors: ColorsLoaderOutput = try loader.load()

        print(colors)

    }
}

