import Raylib

open class ModelEntity: Entity, Drawable {
    open var layer: Int { -1 }

    internal let raylibModel: Raylib.Model
    internal let raylibTexture: Raylib.Texture2D

    public var scale: Float = 1.0
    public var tintColor: Color

    public init(
        path modelPath: String, texture texturePath: String, at location: Vector3, tint: Color
    ) {
        self.raylibModel = Raylib.LoadModel(modelPath)
        self.raylibTexture = Raylib.LoadTexture(texturePath)
        self.tintColor = tint

        self.raylibModel.materials[0].maps[0].texture = self.raylibTexture

        super.init(at: location)
    }

    public func draw(context: DrawContext) {
        Raylib.DrawModel(self.raylibModel, self.location, self.scale, self.tintColor)

    }
}
