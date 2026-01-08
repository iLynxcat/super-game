import Raylib

class Game: GameDelegate {
    let engine: GameEngine

    let player: PlayerFirstPerson
    let camera: Camera

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

        engine.add(player)
        engine.add(camera)
        engine.add(Prop(x: 0, z: -50))
        engine.add(FPSCounter())
        engine.add(PauseMenu(game: self))
    }

    func didStart() {
        DisableCursor()
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
