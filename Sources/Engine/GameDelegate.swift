public protocol GameDelegate {
    func didStart()
    func willStop()

    func willUpdate()
    func willDraw()

    func didUpdate()
    func didDraw()
}

extension GameDelegate {
    public func didStart() {}
    public func willStop() {}

    public func willUpdate() {}
    public func willDraw() {}

    public func didUpdate() {}
    public func didDraw() {}
}
