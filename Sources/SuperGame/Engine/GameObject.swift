import Raylib

protocol GameObject: AnyObject {
    var renderLayer: RenderLayer { get }

    func update(deltaTime: Float)
    func draw()

    func preDraw()
    func postDraw()

    func onWindowResize(width: Int32, height: Int32)
}

extension GameObject {
    var renderLayer: RenderLayer { .world3D }

    func preDraw() {}
    func postDraw() {}

    func onWindowResize(width: Int32, height: Int32) {}
}

protocol Positionable: AnyObject {
    var position: Vector3 { get set }
}
