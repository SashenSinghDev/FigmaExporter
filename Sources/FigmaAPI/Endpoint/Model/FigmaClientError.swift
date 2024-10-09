//
//  FigmaClientError.swift
//
//
//  Created by Sashen Singh on 09/10/2024.
//

import Foundation

struct FigmaClientError: Decodable, LocalizedError {
    let status: Int
    let err: String

    var errorDescription: String? {
        switch err {
        case "Not found":
            return "Figma file not found. Check lightFileId and darkFileId (if you project supports dark mode) in the yaml config file."
        default:
            return "Figma API: \(err)"
        }
    }
}
