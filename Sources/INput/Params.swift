import Foundation

struct Params: Decodable {

    struct Figma: Decodable {
        let lightFileId: String
        let darkFileId: String?
        let timeout: TimeInterval?
    }

    struct Common: Decodable {
        struct VariablesColors: Decodable {
            let tokensFileId: String
            let tokensCollectionName: String

            let lightModeName: String
            let darkModeName: String?
        }

        let variablesColors: VariablesColors?
    }

    struct iOS: Decodable {

        struct Colors: Decodable {
            let colorSwift: URL?
            let swiftuiColorSwift: URL?
        }

        let xcassetsPath: URL
    }


    let figma: Figma
    let ios: iOS?
    let common: Common?
}
