import UIKit

extension UIViewController {
    convenience init(fromPreferredNib: Void) {
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: Self.self)
        self.init(nibName: nibName, bundle: bundle)
    }
}
