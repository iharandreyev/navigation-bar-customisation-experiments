import UIKit

extension UIImage {
    func tintedWith(color aColor: UIColor, imageSize: CGSize? = nil, canvasSize: CGSize? = nil) -> UIImage {
        guard aColor != .clear else { return self }
        let imageSize = imageSize ?? size
        let canvasSize = canvasSize ?? imageSize
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, 0)
        let origin = CGPoint(
            x: (canvasSize.width - imageSize.width) / 2,
            y: (canvasSize.height - imageSize.height) / 2
        )
        let rect = CGRect(origin: origin, size: imageSize)
        draw(
            in: rect,
            blendMode: .normal,
            alpha: 1.0
        )
        let context = UIGraphicsGetCurrentContext()
        context?.setBlendMode(.sourceIn)
        aColor.set()
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? self
    }
}
