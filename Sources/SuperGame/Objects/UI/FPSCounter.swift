import Raylib

class FPSCounter: GameObject {
    let renderLayer: RenderLayer = .ui

    func update(deltaTime: Float) {}

    func draw() {
        DrawFPS(10, 10)
    }
}
