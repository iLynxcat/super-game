import Raylib

class PlayerFirstPerson: GameObject3D, Collidable {
    let size: Float = 50.0
    let speed: Float = 100.0  // units per second
    var position = Vector3(x: 0, y: 25, z: 0)

    var collisionBox: BoundingBox {
        BoundingBox.init(
            center: position, size: Vector3(x: 12, y: 0, z: 12)
        )
    }

    weak var camera: Camera?

    func update(deltaTime: Float) {
        guard let camera else { return }

        let movement = speed * deltaTime
        let forward = camera.getForwardDirection()
        let right = camera.getRightDirection()

        if IsKeyDown(KEY_W.asInt32) {
            position.x += forward.x * movement
            position.z += forward.z * movement
        }
        if IsKeyDown(KEY_S.asInt32) {
            position.x -= forward.x * movement
            position.z -= forward.z * movement
        }
        if IsKeyDown(KEY_A.asInt32) {
            position.x -= right.x * movement
            position.z -= right.z * movement
        }
        if IsKeyDown(KEY_D.asInt32) {
            position.x += right.x * movement
            position.z += right.z * movement
        }
    }
}

extension KeyboardKey {
    var asInt32: Int32 {
        Int32(self.rawValue)
    }
}
