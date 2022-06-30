import UIKit

extension UIViewController {
    func configureNavigationItem(with style: NavigationBarStyle) {
        let scrollEdgeAppearance = style.scrollEdgeAppearance.map(UINavigationBarAppearance.init)
        navigationItem.scrollEdgeAppearance = scrollEdgeAppearance
        let standardAppearance = UINavigationBarAppearance(style.standardAppearance)
        navigationItem.standardAppearance = standardAppearance
        navigationItem.compactAppearance = standardAppearance

        // remove back button title
        navigationItem.backButtonDisplayMode = .minimal
    }
}
