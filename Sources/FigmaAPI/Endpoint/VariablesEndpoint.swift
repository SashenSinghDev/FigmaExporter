//
//  VariablesEndpoint.swift
//
//
//  Created by Sashen Singh on 09/10/2024.
//

import Foundation

public struct VariablesEndpoint: BaseEndpoint {
    public typealias Content = VariablesMeta

    private let fileId: String

    public init(fileId: String) {
        self.fileId = fileId
    }

    func content(from root: VariablesResponse) -> Content {
        return root.meta
    }

    public func makeRequest(baseURL: URL) -> URLRequest {
        let url = baseURL
            .appendingPathComponent("files")
            .appendingPathComponent(fileId)
            .appendingPathComponent("variables")
            .appendingPathComponent("local")
        return URLRequest(url: url)
    }

}
