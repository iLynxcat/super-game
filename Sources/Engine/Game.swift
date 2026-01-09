@_exported import Foundation

import func Raylib.GetFrameTime

public class Game {
    public let window: GameWindow

    public let eventDispatcher: EventDispatcher
    public var objects = [any GameObject]()

    public init(windowTitle: String, windowSize: WindowSize = (800, 600)) {
        self.window = try! GameWindow(withTitle: windowTitle, size: windowSize)

        self.eventDispatcher = EventDispatcher()
    }

    public func run() {
        start()
        repeat {
            let deltaTime = Double(Raylib.GetFrameTime())
            update(deltaTime: deltaTime)
            draw(deltaTime: deltaTime)
        } while !window.shouldClose
        quit()
    }

    private func start() {
        window.setup()
    }

    private func quit() {
        window.close()
    }
}
