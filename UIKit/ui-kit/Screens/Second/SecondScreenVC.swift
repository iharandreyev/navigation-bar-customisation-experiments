import UIKit

final class SecondScreenVC: UIViewController {
    @IBOutlet private var tableView: UITableView!

    var navigationAction: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCellType(UITableViewCell.self)
    }
}

extension SecondScreenVC: UITableViewDataSource {
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

extension SecondScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationAction?("Item \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
