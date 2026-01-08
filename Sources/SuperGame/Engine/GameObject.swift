import Raylib

protocol GameObject: AnyObject {
    var renderLayer: RenderLayer { get }

    func update(deltaTime: Float)
    func draw()

    func preDraw()
    func postDraw()
}

extension GameObject {
    var renderLayer: RenderLayer { .world3D }

    func preDraw() {}
    func postDraw() {}
}

protocol Positionable: AnyObject {
    var position: Vector3 { get set }
}
