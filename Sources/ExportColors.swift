//
//  ExportColors.swift
//
//
//  Created by Sashen Singh on 30/09/2024.
//

import Foundation
import ArgumentParser

struct ExportColors: ParsableCommand {

    public static let configuration = CommandConfiguration(abstract: "Generate a blog post banner from the given input")

    @Argument(help: "The title of the blog post")
    private var title: String

    @Option(name: .shortAndLong, help: "The week of the blog post as used in the file name")
    private var week: Int?

    func run() throws {
        print("Creating a banner for title \"\(title)\" \(String(describing: week))")
    }
}

