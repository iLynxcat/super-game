import Raylib

protocol GameObject: AnyObject {
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
    func load() {}

    func update(deltaTime: Float) {}
    func draw() {}
    func preDraw() {}
    func postDraw() {}

    func onWindowResize(width: Int32, height: Int32) {}
    func onKeyDown(key: KeyboardKey) {}
}
