import Raylib

protocol GameObject: AnyObject {
    var position: Vector3 { get set }

    func update(deltaTime: Float)
    func draw()

    func preDraw()
    func postDraw()
}

extension GameObject {
    func preDraw() {}
    func postDraw() {}
}
