import Raylib

class Prop: GameObject3D {
    var position = Vector3(x: 0, y: 25, z: 0)

    var model: Model?

    func load() {
        self.model = LoadModel("Sources/SuperGame/Resources/turret.obj")
    }

    func draw() {
        guard let model else { return }
        DrawModel(model, position, 1.0, .white)
    }
}
