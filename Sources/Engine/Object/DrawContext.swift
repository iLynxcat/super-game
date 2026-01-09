import Foundation
import Raylib

public struct DrawContext {
    public let window: GameWindow
    public let deltaTime: TimeInterval

    public init(window: GameWindow, deltaTime: Double) {
        self.window = window
        self.deltaTime = deltaTime
    }

    public func clear(color: Color) {
        Raylib.ClearBackground(color)
    }

    public func drawPlane(center: Vector3, size: Vector2, color: Color) {
        Raylib.DrawPlane(center, size, color)
    }

    public func drawBoundingBox(_ box: BoundingBox, color: Color) {
        Raylib.DrawBoundingBox(box, color)
    }

    public func drawCenteredGrid(slices: Int32, spacing: Float) {
        Raylib.DrawGrid(slices, spacing)
    }
}
