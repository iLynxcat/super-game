import Engine

public class Prop: ModelEntity {
    override public var layer: Int { DrawLayer.world.rawValue }

    init(modelPath: String, texturePath: String, at location: Vector3) {
        super.init(path: modelPath, texture: texturePath, at: location, tint: .white)
        self.scale = 0.3
    }
}
