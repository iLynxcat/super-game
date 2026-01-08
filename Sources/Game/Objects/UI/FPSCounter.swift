import Engine

class FPSCounter: GameObject {
    let renderLayer: RenderLayer = .ui

    func draw() {
        DrawFPS(10, 10)
    }
}
