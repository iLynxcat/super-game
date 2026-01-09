import Foundation
import Raylib

public protocol Updatable: GameObject {
    func update(context: UpdateContext)
}

extension Game {
    internal func update() {
        let context = UpdateContext(
            deltaTime: Double(Raylib.GetFrameTime()), mouseDelta: Raylib.GetMouseDelta())

        objects.getAll(ofType: Updatable.self).forEach {
            $0.update(context: context)
        }
    }
}
