import Raylib

class PauseMenu: GameObject {
    let game: Game

    var screenWidth: Int32
    var screenHeight: Int32

    let backgroundColor: Color = .darkGray.withOpacity(128)
    let renderLayer: RenderLayer = .ui

    var shouldRender: Bool {
        get {
            game.status == .paused
        }
        set {
            game.status = newValue ? .paused : .playing
        }
    }

    init(game: Game) {
        self.game = game
        self.screenWidth = game.engine.windowWidth
        self.screenHeight = game.engine.windowHeight
    }

    func onWindowResize(width: Int32, height: Int32) {
        self.screenWidth = width
        self.screenHeight = height
    }

    func draw() {
        guard shouldRender else { return }

        DrawRectangleV(
            Vector2(x: 0, y: 0),
            Vector2(x: Float(screenWidth), y: Float(screenHeight)),
            backgroundColor
        )

        drawItem("Paused", 128, selected: false)
    }

    func onKeyDown(key: KeyboardKey) {
        if key == KEY_ESCAPE {
            shouldRender.toggle()
        }
    }

    private func drawItem(_ text: String, _ y: Int32, selected: Bool) {
        let centerX = screenWidth / 2
        let size: Int32 = 20
        let width = MeasureText(text, size)
        let color: Color = selected ? .purple : .white

        DrawText(text, centerX - width / 2, y, size, color)
    }
}
