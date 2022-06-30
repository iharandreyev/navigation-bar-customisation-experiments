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
        self.scrollEdgeAppearance = scrollEdgeAppearance
        let standardAppearance = UINavigationBarAppearance(style.standardAppearance)
        self.standardAppearance = standardAppearance
        self.compactAppearance = standardAppearance
    }
}
