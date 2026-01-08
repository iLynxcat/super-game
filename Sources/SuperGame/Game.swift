class Game {
    let engine: GameEngine

    let player: PlayerCube
    let camera: Camera

    var status: GameStatus = .playing {
        didSet {
            engine.shouldUpdate = status == .playing
        }
    }

    init() {
        self.engine = GameEngine(
            width: 800, height: 600,
            title: "Super Game"
        )

        self.player = PlayerCube()
        self.camera = Camera(target: player)

        engine.add(player)
        engine.add(camera)
        engine.add(FPSCounter())
        engine.add(PauseMenu(game: self))
    }

    func run() {
        engine.run()
    }
}
