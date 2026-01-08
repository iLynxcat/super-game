class Game {
    var engine: GameEngine

    var player: PlayerCube
    var camera: Camera

    init() {
        self.engine = GameEngine(
            width: 800, height: 600,
            title: "Super Game"
        )

        self.player = PlayerCube()
        self.camera = Camera(target: player)

        engine.add(player)
        engine.add(camera)
    }

    func run() {
        engine.run()
    }
}
