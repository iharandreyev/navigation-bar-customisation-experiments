import UIKit

final class FirstScreenVC: UIViewController {
    @IBOutlet private var tableView: UITableView!

    var navigationAction: ((String) -> Void)?

    private var navigationBarStyle: NavigationBarStyle {
        .first()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCellType(UITableViewCell.self)
        configureNavigationItem(with: navigationBarStyle)
        navigationItem.rightBarButtonItems = [
            createMessageItem()
        ]
    }

    private func createMessageItem() -> UIBarButtonItem {
        let item = UIBarButtonItem(
            image: UIImage(systemName: "gear.badge.questionmark"),
            style: .plain,
            target: self,
            action: #selector(showMessage)
        )
        item.tintColor = .with(token: navigationBarStyle.standardAppearance.titleStyle.color)
        return item
    }

    @objc
    private func showMessage() {
        let alert = UIAlertController(
            title: "Message",
            message: "You've clicked a navigation item",
            preferredStyle: .alert
        )
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
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
