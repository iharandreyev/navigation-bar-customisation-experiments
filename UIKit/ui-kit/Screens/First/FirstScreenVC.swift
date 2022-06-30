import UIKit

final class FirstScreenVC: UIViewController {
    @IBOutlet private var tableView: UITableView!

    var navigationAction: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCellType(UITableViewCell.self)
        configureNavigationItem()
    }

    private func configureNavigationItem() {
        let titleStyle = TextStyle(font: .titleDefault, color: .textPrimary)
        let navigationBarStyle = NavigationBarStyle(
            scrollEdgeAppearance: .transparent(titleStyle: titleStyle),
            standardAppearance: .blurred(titleStyle: titleStyle)
        )
        configureNavigationItem(with: navigationBarStyle)
    }
}

extension FirstScreenVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueCell(for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = "Cell \(indexPath.row)"
        config.textProperties.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        cell.contentConfiguration = config
        return cell
    }
}

extension FirstScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationAction?("Item \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

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

enum ThirdScreenFactory {
    static func createViewController(title: String) -> ThirdScreenVC {
        let viewController = ThirdScreenVC(fromPreferredNib: ())
        viewController.title = "Third [\(title)]"
        return viewController
    }
}
