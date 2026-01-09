import Foundation

public protocol Updatable: GameObject {
    func update(deltaTime: TimeInterval)
}

extension Game {
    internal func update(deltaTime: TimeInterval) {
        objects.getAll(ofType: Updatable.self).forEach {
            $0.update(deltaTime: deltaTime)
        }
    }
}
