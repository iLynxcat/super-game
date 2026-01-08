import Raylib

class Game: GameDelegate {
    let engine: GameEngine

    let player: PlayerFirstPerson
    let camera: Camera

    var pauseMenu: PauseMenu?

    var status: GameStatus = .playing {
        didSet {
            engine.shouldUpdate = status == .playing
        }
    }

    private var hasCollision = false

    init() {
        self.engine = GameEngine(title: "Super Game")

        self.player = PlayerFirstPerson()
        self.camera = Camera(target: player)

        self.player.camera = camera

        self.pauseMenu = PauseMenu(game: self)

        engine.add(player)
        engine.add(camera)
        engine.add(Prop(x: 0, z: -50))
        engine.add(FPSCounter())
        guard let pauseMenu = pauseMenu else { fatalError("Pause menu not initialized") }
        engine.add(pauseMenu)
    }

    func didStart() {
        DisableCursor()
    }

    func willUpdate() {
        if !IsWindowFocused() {
            self.pauseMenu?.shouldRender = true
        }
    }

    func didUpdate() {
        let collidersCollidingWithPlayer = engine.collidables()
            .filter { $0 !== player && $0.collides(with: player) }

        if collidersCollidingWithPlayer.isEmpty {
            hasCollision = false
        } else {
            hasCollision = true
        }
    }

    func willDraw() {
        if hasCollision {
            ClearBackground(.purple)
        } else {
            ClearBackground(.black)
        }
    }

    func run() {
        engine.delegate = self
        engine.run()
    }
}
