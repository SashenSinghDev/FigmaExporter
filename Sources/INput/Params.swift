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
            let useColorAssets: Bool
            let assetsFolder: String?
            let groupUsingNamespace: Bool?
        }

        let xcassetsPath: URL
        let xcassetsInMainBundle: Bool
        let xcassetsInSwiftPackage: Bool?
        let resourceBundleNames: [String]?
        let addObjcAttribute: Bool?
        let templatesPath: URL?

        let colors: Colors?
    }


    let figma: Figma
    let ios: iOS?
    let common: Common?
}
