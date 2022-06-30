import UIKit

extension UIBlurEffect {
    static func with(effect: BackgroundEffect) -> UIBlurEffect {
        switch effect {
        case .systemMaterial: return UIBlurEffect(style: .systemMaterial)
        }
    }
}
