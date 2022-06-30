import UIKit

extension UIColor {
    static func with(token: ColorToken) -> UIColor {
        switch token {
        case .clear: return .clear
        case .textPrimary: return .black
        case .textSecondary: return .blue
        case .textTetriary: return .green
        case .backgroundPrimary: return .white
        case .backgroundSecondary: return .gray
        }
    }
}
