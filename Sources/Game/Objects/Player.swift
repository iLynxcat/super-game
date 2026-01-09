import Engine

class Player: LivingEntity, Drawable {
    var layer: Int { DrawLayer.world.rawValue }

    var eyeLocation: Vector3 {
        location + Vector3(0, 1.8, 0)
    }
    var location = Vector3(0, 0, 25)

    public func update(context: UpdateContext) {
    }

    public func draw(context: DrawContext) {
        context.drawPlane(center: .zero, size: Vector2(200, 200), color: .white)
    }
}
