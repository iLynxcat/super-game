class Game: GameDelegate {
    let engine: GameEngine

    let player: PlayerFirstPerson
    let camera: Camera

    var status: GameStatus = .playing {
        didSet {
            engine.shouldUpdate = status == .playing
        }
    }

    init() {
        self.engine = GameEngine(title: "Super Game")

        self.player = PlayerFirstPerson()
        self.camera = Camera(target: player)

        self.player.camera = camera

        engine.add(player)
        engine.add(camera)
        engine.add(Prop())
        engine.add(FPSCounter())
        engine.add(PauseMenu(game: self))
    }

    func didStart() {
        HideCursor()
    }

    func didUpdate() {
        // todo: collision checks
    }

    func willDraw() {
        ClearBackground(.black)
    }

    func run() {
        engine.delegate = self
        engine.run()
    }
}
