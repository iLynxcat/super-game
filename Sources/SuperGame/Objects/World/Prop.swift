import Raylib

class Prop: GameObject3D, Collidable {
    var position = Vector3(x: 0, y: 0, z: 0)

    var collisionBox: BoundingBox {
        guard let model else { return BoundingBox(min: Vector3(), max: Vector3()) }
        return GetModelBoundingBox(model)
    }
    var model: Model?

    internal init() {}

    func load() {
        self.model = LoadModel("Sources/SuperGame/Resources/turret.obj")
    }

    func draw() {
        guard let model else { return }
        DrawModel(model, position, 1.0, .white)
    }
}
