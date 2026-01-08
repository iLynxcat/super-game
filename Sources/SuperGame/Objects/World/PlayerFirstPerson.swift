import Raylib

class PlayerFirstPerson: GameObject3D, Collidable {
    let size: Float = 50.0
    let speed: Float = 100.0  // units per second
    var position = Vector3(x: 0, y: 0, z: 0)
    var eyePosition: Vector3 {
        Vector3(x: position.x, y: position.y + 25, z: position.z)
    }

    private let collisionSize: Float = 7
    var collisionBox: BoundingBox {
        BoundingBox(
            min: Vector3(
                x: position.x - collisionSize, y: position.y, z: position.z - collisionSize),
            max: Vector3(
                x: position.x + collisionSize, y: position.y + 25, z: position.z + collisionSize)
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
        if IsKeyDown(KEY_LEFT_SHIFT.asInt32) {
            position.y = max(position.y - movement, 0)
        }
        if IsKeyDown(KEY_SPACE.asInt32) {
            position.y = min(position.y + movement, 512)
        }
    }
}

extension KeyboardKey {
    var asInt32: Int32 {
        Int32(self.rawValue)
    }
}
