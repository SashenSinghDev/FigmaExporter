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

    enum VectorFormat: String, Decodable {
        case pdf
        case svg
    }

    struct Android: Decodable {
        struct Colors: Decodable {
            let xmlOutputFileName: String?
            let composePackageName: String?
        }

        let mainRes: URL
        let colors: Colors?
    }

    struct iOS: Decodable {

        struct Colors: Decodable {
            let colorSwift: URL?
            let swiftuiColorSwift: URL?
            let useColorAssets: Bool
            let assetsFolder: String?
            let groupUsingNamespace: Bool?
        }
        
        struct Icons: Decodable {
            let format: VectorFormat
            let assetsFolder: String
            let preservesVectorRepresentation: [String]?

            let imageSwift: URL?
            let swiftUIImageSwift: URL?

            let renderMode: XcodeRenderMode?
            let renderModeDefaultSuffix: String?
            let renderModeOriginalSuffix: String?
            let renderModeTemplateSuffix: String?
        }

        let xcassetsPath: URL
        let xcassetsInMainBundle: Bool
        let xcassetsInSwiftPackage: Bool?
        let resourceBundleNames: [String]?
        let addObjcAttribute: Bool?
        let templatesPath: URL?

        let colors: Colors?
        let icons: Icons?
    }


    let figma: Figma
    let ios: iOS?
    let android: Android?
    let common: Common?
}
