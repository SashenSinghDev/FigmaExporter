//
//  ImagesProcessor.swift
//
//
//  Created by Sashen Singh on 03/11/2024.
//

import Foundation

public struct ImagesProcessor: AssetsProcessable {
    public typealias AssetType = ImagePack

    public let platform: Platform
    public let nameValidateRegexp: String?
    public let nameReplaceRegexp: String?
    public let nameStyle: NameStyle?

    public init(platform: Platform, nameValidateRegexp: String? = nil, nameReplaceRegexp: String? = nil, nameStyle: NameStyle?) {
        self.platform = platform
        self.nameValidateRegexp = nameValidateRegexp
        self.nameReplaceRegexp = nameReplaceRegexp
        self.nameStyle = nameStyle
    }
}
