//
//  File.swift
//  
//
//  Created by Sashen Singh on 13/10/2024.
//

import Foundation

struct XcodeEmptyContents {

    let fileURL = URL(string: "Contents.json")!

    let data = """
    {
      "info" : {
        "author" : "xcode",
        "version" : 1
      }
    }

    """.data(using: .utf8)!
}
