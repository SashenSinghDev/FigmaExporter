import Foundation

struct Params: Decodable {

    struct Figma: Decodable {
        let lightFileId: String
        let darkFileId: String?
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
}
