//
//  Configuration.swift
//
//
//  Created by Sashen Singh on 30/09/2024.
//

import ArgumentParser
import Foundation
import Yams

struct Configuration: ParsableArguments {
    static let input = "figma-export.yaml"

    @Option(name: .shortAndLong, help: "An input YAML file with figma and platform properties.")
    var input: String = Self.input

    var accessToken: String!
    var params: Params!

    mutating func validate() throws {
        guard let token = ProcessInfo.processInfo.environment["FIGMA_PERSONAL_TOKEN"] else {
            throw FigmaExporterError.accessTokenNotFound
        }
        self.accessToken = token
        self.params = try readParams(at: input)
    }

    private func readParams(at path: String) throws -> Params {
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        let string = String(decoding: data, as: UTF8.self)
        let decoder = YAMLDecoder()
        return try decoder.decode(Params.self, from: string)
    }
}
