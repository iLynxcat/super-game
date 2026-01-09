import Engine

public class Backdrop: Drawable {
    public var layer: Int { DrawLayer.world.rawValue }

    public func draw(context: DrawContext) {
        context.clear(color: .black)
        context.drawPlane(center: .zero, size: Vector2(20, 20), color: .white)
    }
}
