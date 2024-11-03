// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct FigmaExporter: ParsableCommand {

    static let configuration = CommandConfiguration(
        abstract: "A Swift command-line tool to manage blog post banners",
        subcommands: [ExportVariableColors.self,
                      ExportIcons.self])
}
