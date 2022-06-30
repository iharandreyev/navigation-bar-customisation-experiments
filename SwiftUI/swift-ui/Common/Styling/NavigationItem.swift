import UIKit

final class NavigationItem {
    private weak var navigationBar: UINavigationBar?

    init(_ navigationBar: UINavigationBar) {
        self.navigationBar = navigationBar
    }

    var scrollEdgeAppearance: UINavigationBarAppearance? {
        get { navigationBar?.scrollEdgeAppearance }
        set { navigationBar?.scrollEdgeAppearance = newValue }
    }

    var standardAppearance: UINavigationBarAppearance {
        get { navigationBar?.standardAppearance ?? UINavigationBarAppearance() }
        set { navigationBar?.standardAppearance = newValue }
    }

    var compactAppearance: UINavigationBarAppearance? {
        get { navigationBar?.compactAppearance }
        set { navigationBar?.compactAppearance = newValue }
    }
}

extension NavigationItem {
    func configure(with style: NavigationBarStyle) {
        let scrollEdgeAppearance = style.scrollEdgeAppearance.map(UINavigationBarAppearance.init)
        scrollEdgeAppearance?.backButtonAppearance.setTitleHidden()
        self.scrollEdgeAppearance = scrollEdgeAppearance
        let standardAppearance = UINavigationBarAppearance(style.standardAppearance)
        standardAppearance.backButtonAppearance.setTitleHidden()
        self.standardAppearance = standardAppearance
        self.compactAppearance = standardAppearance
    }
}

extension UIBarButtonItemAppearance {
    fileprivate func setTitleHidden() {
        normal.setTitleHidden()
        disabled.setTitleHidden()
        focused.setTitleHidden()
        highlighted.setTitleHidden()
    }
}

extension UIBarButtonItemStateAppearance {
    fileprivate func setTitleHidden() {
        titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 0),
            .foregroundColor: UIColor.clear
        ]
    }
}
