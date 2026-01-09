import Engine

extension Camera {
    var layer: Int { DrawLayer.world.rawValue }

    public func draw(context: DrawContext) {
        context.drawCenteredGrid(slices: 50, spacing: 20)
    }
}
