protocol GameDelegate {
    func didStart()
    func willStop()

    func willUpdate()
    func willDraw()

    func didUpdate()
    func didDraw()
}

extension GameDelegate {
    func didStart() {}
    func willStop() {}

    func willUpdate() {}
    func willDraw() {}

    func didUpdate() {}
    func didDraw() {}
}
