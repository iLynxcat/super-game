extension Array {
    public func getAll<T>(ofType: T.Type) -> [T] {
        self.compactMap { $0 as? T }
    }
    public func getFirst<T>(ofType: T.Type) -> T? {
        self.lazy.compactMap { $0 as? T }.first
    }
}
