import Foundation
import Raylib

public protocol Drawable: GameObject {
    var layer: Int { get }

    func preDraw(context: DrawContext)
    func draw(context: DrawContext)
    func postDraw(context: DrawContext)
}

extension Drawable {
    public func preDraw(context: DrawContext) {}
    public func postDraw(context: DrawContext) {}
}

extension Game {
    internal func draw(deltaTime: TimeInterval) {
        let drawContext = DrawContext(window: window, deltaTime: deltaTime)
        let drawables = Dictionary(grouping: objects.getAll(ofType: Drawable.self)) {
            $0.layer
        }

        Raylib.BeginDrawing()
        defer { Raylib.EndDrawing() }

        for layer in drawables.keys.sorted() {
            guard let drawables = drawables[layer] else { continue }
            drawables.forEach {
                $0.preDraw(context: drawContext)
            }
            drawables.forEach {
                $0.draw(context: drawContext)
            }
            drawables.forEach {
                $0.postDraw(context: drawContext)
            }
        }
    }
}
