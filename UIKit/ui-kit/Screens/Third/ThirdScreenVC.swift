import UIKit

final class ThirdScreenVC: UIViewController {
    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCellType(UITableViewCell.self)
        configureNavigationItem()
    }

    private func configureNavigationItem() {
        let navigationBarStyle = NavigationBarStyle(
            scrollEdgeAppearance: .init(
                titleStyle: TextStyle(font: .titleBigger, color: .textTetriary),
                backgroundColor: .backgroundSecondary,
                backgroundEffect: nil,
                hasShadow: true,
                backIndicatorImage: .backButton
            ),
            standardAppearance: .blurred(
                titleStyle: TextStyle(font: .titleBigger, color: .textTetriary)
            )
        )
        configureNavigationItem(with: navigationBarStyle)
    }
}

extension ThirdScreenVC: UITableViewDataSource {
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

extension ThirdScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
