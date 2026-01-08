import Raylib

protocol GameObject: AnyObject {
    func update(deltaTime: Float)
    func draw()

    func preDraw()
    func postDraw()
}

extension GameObject {
    func preDraw() {}
    func postDraw() {}
}

protocol Positionable: AnyObject {
    var position: Vector3 { get set }
}
