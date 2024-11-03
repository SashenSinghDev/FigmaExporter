//
//  Error.swift
//
//
//  Created by Sashen Singh on 30/09/2024.
//

import Foundation

enum FigmaExporterError: LocalizedError {

    case accessTokenNotFound
    case componentsNotFound

    var errorDescription: String? {
        switch self {
        case .accessTokenNotFound:
            return "Environment variable FIGMA_PERSONAL_TOKEN not specified."
        case .componentsNotFound:
            return "Components not found in the Figma file. Have you published Components to the Library?"
        }
    }
}
