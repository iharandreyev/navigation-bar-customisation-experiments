import UIKit

extension UIImage {
    static func with(token: ImageToken) -> UIImage {
        switch token {
        case .backButton: return UIImage(named: "back")!
        }
    }
}
