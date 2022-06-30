import UIKit

private enum Keys {
    static var scrollEdgeAppearance = "scrollEdgeAppearance"
    static var standardAppearance = "standardAppearance"
    static var compactAppearance = "compactAppearance"
}

extension UINavigationBar {
    private enum Appearance {
        case neverSet
        case set(UINavigationBarAppearance?)
    }

    private var defaultScrollEdgeAppearance: Appearance {
        get { associatedObject(forKey: &Keys.scrollEdgeAppearance) ?? .neverSet }
        set { setAssociatedObject(newValue, forKey: &Keys.scrollEdgeAppearance) }
    }
    private var defaultStandardAppearance: Appearance {
        get { associatedObject(forKey: &Keys.standardAppearance) ?? .neverSet }
        set { setAssociatedObject(newValue, forKey: &Keys.standardAppearance) }
    }
    private var defaultCompactAppearance: Appearance {
        get { associatedObject(forKey: &Keys.compactAppearance) ?? .neverSet }
        set { setAssociatedObject(newValue, forKey: &Keys.compactAppearance) }
    }

    static func configureCurrent(_ configure: (NavigationItem) -> Void) {
        let proxy = appearance()
        if case .neverSet = proxy.defaultScrollEdgeAppearance {
            proxy.defaultScrollEdgeAppearance = .set(proxy.scrollEdgeAppearance)
        }
        if case .neverSet = proxy.defaultStandardAppearance {
            proxy.defaultStandardAppearance = .set(proxy.standardAppearance)
        }
        if case .neverSet = proxy.defaultCompactAppearance {
            proxy.defaultCompactAppearance = .set(proxy.compactAppearance)
        }
        let item = NavigationItem(proxy)
        configure(item)
    }

    static func restoreCurrent() {
        let proxy = appearance()
        if case let .set(scrollEdgeAppearance) = proxy.defaultScrollEdgeAppearance {
            proxy.scrollEdgeAppearance = scrollEdgeAppearance
        }
        if case let .set(.some(standardAppearance)) = proxy.defaultStandardAppearance {
            proxy.standardAppearance = standardAppearance
        }
        if case let .set(compactAppearance) = proxy.defaultCompactAppearance {
            proxy.compactAppearance = compactAppearance
        }
    }
}
