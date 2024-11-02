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

    func run() throws {
        let client = FigmaClient(accessToken: configuration.accessToken, timeout: configuration.params.figma.timeout)
        let figmaParams = configuration.params.figma
    }
}
