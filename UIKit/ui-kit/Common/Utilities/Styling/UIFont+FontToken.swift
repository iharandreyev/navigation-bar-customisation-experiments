import UIKit

extension UIFont {
    static func with(token: FontToken) -> UIFont {
        switch token {
        case .titleDefault: return .systemFont(ofSize: 20, weight: .semibold)
        case .titleBigger: return .systemFont(ofSize: 26, weight: .bold)
        }
    }
}
