import Foundation
import Raylib

public typealias WindowSize = (width: Int32, height: Int32)

public class GameWindow {
    nonisolated(unsafe) private static var isInitialized: Bool = false

    public private(set) var title: String {
        didSet {
            Raylib.SetWindowTitle(title)
        }
    }

    public var size: WindowSize {
        didSet {
            let width = size.width
            let height = size.height
            Raylib.SetWindowSize(width, height)
        }
    }

    public init(withTitle title: String, size: WindowSize) throws {
        guard !GameWindow.isInitialized else { throw GameWindowError.alreadyInitialized }

        self.title = title
        self.size = size

        Raylib.InitWindow(size.width, size.height, title)
    }

    public var shouldClose: Bool {
        Raylib.WindowShouldClose()
    }

    public func setup() {
        let currentMonitor = Raylib.GetCurrentMonitor()
        let monitorRefreshRate = Raylib.GetMonitorRefreshRate(currentMonitor)
        let targetFPS = min(monitorRefreshRate, 60)

        Raylib.SetTargetFPS(targetFPS)
    }

    public func close() {
        Raylib.CloseWindow()
    }
}

public enum GameWindowError: Error {
    case alreadyInitialized
}
