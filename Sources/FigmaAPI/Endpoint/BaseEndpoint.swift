//
//  BaseEndpoint.swift
//
//
//  Created by Sashen Singh on 09/10/2024.
//

import Foundation

protocol BaseEndpoint: Endpoint where Content: Decodable {
    /// Content wrapper.
    associatedtype Root: Decodable = Content

    /// Extract content from root.
    func content(from root: Root) -> Content
}

extension BaseEndpoint where Root == Content {
    func content(from root: Root) -> Content { return root }
}

extension BaseEndpoint {

    public func content(from response: URLResponse?, with body: Data) throws -> Content {
        do {
            let resource = try JSONDecoder.default.decode(Root.self, from: body)
            return content(from: resource)
        } catch let mainError {

            if let error = try? JSONDecoder.default.decode(FigmaClientError.self, from: body) {
                throw error
            }

            throw mainError
        }
    }
}

extension JSONDecoder {
    internal static let `default`: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
