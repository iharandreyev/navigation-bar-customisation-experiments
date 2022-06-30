enum FirstScreenFactory {
    static func createViewController() -> FirstScreenVC {
        let viewController = FirstScreenVC(fromPreferredNib: ())
        viewController.title = "First"
        viewController.navigationAction = { [weak viewController] context in
            let next = SecondScreenFactory.createViewController(title: context)
            viewController?.show(next, sender: nil)
        }
        return viewController
    }
}
