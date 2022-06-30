enum SecondScreenFactory {
    static func createViewController(title: String) -> SecondScreenVC {
        let viewController = SecondScreenVC(fromPreferredNib: ())
        viewController.title = "Second [\(title)]"
        viewController.navigationAction = { [weak viewController] context in
            let next = ThirdScreenFactory.createViewController(title: "\(title)->\(context)")
            viewController?.show(next, sender: nil)
        }
        return viewController
    }
}
