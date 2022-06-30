import ObjectiveC

extension NSObject {
    func associatedObject<T>(forKey key: UnsafeRawPointer) -> T? {
        objc_getAssociatedObject(self, key) as? T
    }

    func setAssociatedObject<T>(_ object: T?, forKey key: UnsafeRawPointer) {
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN)
    }
}
