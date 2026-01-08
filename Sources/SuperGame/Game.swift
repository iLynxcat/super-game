import Raylib

class Game {
    var engine = GameEngine()
    var player = PlayerCube()
    var camera: Camera

    init() {
        InitWindow(800, 600, "Super Game")
        SetTargetFPS(60)

        self.player = PlayerCube()
        self.camera = Camera(target: player)

        engine.add(player)
        engine.add(camera)
    }

    func run() {
        while !WindowShouldClose() {
            let deltaTime = GetFrameTime()
            engine.update(deltaTime: deltaTime)
            engine.draw()
        }
        CloseWindow()
    }
}
