import Foundation
import UIKit

typealias StringAttributes = [NSAttributedString.Key: Any]

extension Dictionary where Key == NSAttributedString.Key, Value == Any {
    init(_ textStyle: TextStyle) {
        self = [
            .font: UIFont.with(token: textStyle.font),
            .foregroundColor: UIColor.with(token: textStyle.color)
        ]
    }
}
