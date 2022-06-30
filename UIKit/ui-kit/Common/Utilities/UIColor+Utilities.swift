import UIKit

extension UIColor {
    public var isTransparent: Bool {
        if self == .clear { return true }
        var alpha: CGFloat = 0
        getWhite(nil, alpha: &alpha)
        return alpha == 0
    }
}
