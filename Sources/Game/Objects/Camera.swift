import Engine

extension Camera: Drawable {
    public var layer: Int { DrawLayer.world.rawValue }

    public func preDraw(context: DrawContext) {
        context.clear(color: .black)
    }

    public func draw(context: DrawContext) {
        context.drawPlane(center: .zero, size: Vector2(20, 20), color: .white)
    }
}
