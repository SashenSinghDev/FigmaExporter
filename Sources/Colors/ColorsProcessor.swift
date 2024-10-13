//
//  ColorsProcessor.swift
//
//
//  Created by Sashen Singh on 11/10/2024.
//

import Foundation

public struct ColorsProcessor: AssetsProcessable {
    public typealias AssetType = Color

    public let nameValidateRegexp: String?
    public let nameReplaceRegexp: String?
    public let nameStyle: NameStyle?

    public init(nameValidateRegexp: String?, nameReplaceRegexp: String?, nameStyle: NameStyle?) {
        self.nameValidateRegexp = nameValidateRegexp
        self.nameReplaceRegexp = nameReplaceRegexp
        self.nameStyle = nameStyle
    }
}
