import UIKit

extension UITableView {
    func registerCellType<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseId)
    }

    func dequeueCell<T: UITableViewCell>(
        _ type: T.Type = T.self,
        for indexPath: IndexPath
    ) -> T {
        guard
            let cell = dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as? T
        else {
            assertionFailure("Ubable to dequeue \(T.self) for \(indexPath)")
            return T(frame: .zero)
        }
        return cell
    }
}
