//
//  Color.swift
//
//
//  Created by Sashen Singh on 09/10/2024.
//

import Foundation

public protocol Asset: Hashable {
    var name: String { get set }
}

public struct Color: Asset {

    public var name: String

    public let originalName: String

    /// Color components, Double value from 0 to 1
    public let red, green, blue, alpha: Double

    public init(name: String, red: Double, green: Double, blue: Double, alpha: Double) {
        self.name = name
        self.originalName = name
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    // MARK: Hashable

    public static func == (lhs: Color, rhs: Color) -> Bool {
        return lhs.name == rhs.name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

}
