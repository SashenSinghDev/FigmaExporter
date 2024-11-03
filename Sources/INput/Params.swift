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

        struct Icons: Decodable {
            let nameValidateRegexp: String?
            let figmaFrameName: String?
            let nameReplaceRegexp: String?
            let useSingleFile: Bool?
            let darkModeSuffix: String?
        }

        struct Images: Decodable {
            let nameValidateRegexp: String?
            let figmaFrameName: String?
            let nameReplaceRegexp: String?
            let useSingleFile: Bool?
            let darkModeSuffix: String?
        }

        let variablesColors: VariablesColors?
        let icons: Icons?
        let images: Images?
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

        struct Icons: Decodable {
            let output: String
            let composePackageName: String?
        }

        struct Images: Decodable {
            enum Format: String, Decodable {
                case svg
                case png
                case webp
            }
            struct FormatOptions: Decodable {
                enum Encoding: String, Decodable {
                    case lossy
                    case lossless
                }
                let encoding: Encoding
                let quality: Int?
            }
            let scales: [Double]?
            let output: String
            let format: Format
            let webpOptions: FormatOptions?
        }

        let mainRes: URL
        let colors: Colors?
        let icons: Icons?
        let images: Images?
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

        struct Images: Decodable {
            let assetsFolder: String
            let scales: [Double]?

            let imageSwift: URL?
            let swiftUIImageSwift: URL?
        }

        let xcassetsPath: URL
        let xcassetsInMainBundle: Bool
        let xcassetsInSwiftPackage: Bool?
        let resourceBundleNames: [String]?
        let addObjcAttribute: Bool?
        let templatesPath: URL?

        let colors: Colors?
        let icons: Icons?
        let images: Images?
    }


    let figma: Figma
    let ios: iOS?
    let android: Android?
    let common: Common?
}
