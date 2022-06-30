import UIKit

extension UINavigationBarAppearance {
    convenience init(_ appearance: NavigationBarStyle.Appearance) {
        self.init()

        let backgroundColor = UIColor
            .with(token: appearance.backgroundColor)
        configureWithBackgroundColor(backgroundColor)

        backgroundEffect = appearance.backgroundEffect.map(UIBlurEffect.with)
        titleTextAttributes = StringAttributes(appearance.titleStyle)

        let backIndicatorTintColor = UIColor
            .with(token: appearance.titleStyle.color)
        let backIndicatorImage = UIImage
            .with(token: appearance.backIndicatorImage)
            .tintedWith(color: backIndicatorTintColor)
            .withRenderingMode(.alwaysOriginal)
        setBackIndicatorImage(backIndicatorImage, transitionMaskImage: backIndicatorImage)

        if !appearance.hasShadow {
            shadowColor = .clear
        }
    }

    private func configureWithBackgroundColor(_ color: UIColor) {
        if color.isTransparent {
            configureWithTransparentBackground()
        } else {
            configureWithDefaultBackground()
            backgroundColor = color
        }
    }
}
