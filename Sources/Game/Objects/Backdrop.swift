import Engine

public class Backdrop: Drawable {
    public var layer: Int { DrawLayer.background.rawValue }

    public func draw(context: DrawContext) {
        context.clear(color: .black)
    }
}
