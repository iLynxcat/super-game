import Engine

extension Color {
    fileprivate static let groundColor = Color(255, 128, 0)
}

public class Backdrop: Drawable {
    public var layer: Int { DrawLayer.world.rawValue }

    public func draw(context: DrawContext) {
        context.clear(color: .black)
        context.drawPlane(center: .zero, size: Vector2(64, 64), color: .groundColor)
    }
}
