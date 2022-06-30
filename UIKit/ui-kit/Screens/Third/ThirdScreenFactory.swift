enum ThirdScreenFactory {
    static func createViewController(title: String) -> ThirdScreenVC {
        let viewController = ThirdScreenVC(fromPreferredNib: ())
        viewController.title = "Third [\(title)]"
        return viewController
    }
}
