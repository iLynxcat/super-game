import Engine

class Camera: GameCamera {
    override var layer: Int { DrawLayer.world.rawValue }

    override public func draw(context: DrawContext) {
    }
}
