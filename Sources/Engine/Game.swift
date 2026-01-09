@_exported import Foundation
import Raylib

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
            update()
            draw()
        } while !window.shouldClose
        quit()
    }

    private func start() {
        window.setup()
        Raylib.DisableCursor()
    }

    private func quit() {
        Raylib.EnableCursor()
        window.close()
    }
}
