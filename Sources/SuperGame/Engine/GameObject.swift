import Raylib

protocol GameObject: AnyObject {
    var renderLayer: RenderLayer { get }

    func update(deltaTime: Float)
    func draw()

    func preDraw()
    func postDraw()

    func onWindowResize(width: Int32, height: Int32)
    func onKeyDown(key: KeyboardKey)
}

extension GameObject {
    func update(deltaTime: Float) {}
    func draw() {}
    func preDraw() {}
    func postDraw() {}

    func onWindowResize(width: Int32, height: Int32) {}
    func onKeyDown(key: KeyboardKey) {}
}

protocol GameObject3D: GameObject {
    var position: Vector3 { get set }
}

extension GameObject3D {
    var renderLayer: RenderLayer { .world3D }
}
