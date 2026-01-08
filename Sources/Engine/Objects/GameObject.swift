import Raylib

public protocol GameObject: AnyObject {
    var renderLayer: RenderLayer { get }

    func load()

    func update(deltaTime: Float)
    func draw()

    func preDraw()
    func postDraw()

    func onWindowResize(width: Int32, height: Int32)
    func onKeyDown(key: KeyboardKey)
}

extension GameObject {
    public func load() {}

    public func update(deltaTime: Float) {}
    public func draw() {}
    public func preDraw() {}
    public func postDraw() {}

    public func onWindowResize(width: Int32, height: Int32) {}
    public func onKeyDown(key: KeyboardKey) {}
}
