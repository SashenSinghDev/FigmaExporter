//
//  File.swift
//  
//
//  Created by Sashen Singh on 12/10/2024.
//

import Foundation

public extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
