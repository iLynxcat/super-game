import Raylib

class PlayerCube: GameObject3D {
    let size: Float = 50.0
    let speed: Float = 100.0  // units per second
    var position = Vector3(x: 0, y: 25, z: 0)

    func update(deltaTime: Float) {
        let movement = speed * deltaTime

        if IsKeyDown(KEY_W.asInt32) {
            position.z -= movement
        }
        if IsKeyDown(KEY_S.asInt32) {
            position.z += movement
        }
        if IsKeyDown(KEY_A.asInt32) {
            position.x -= movement
        }
        if IsKeyDown(KEY_D.asInt32) {
            position.x += movement
        }
    }

    func draw() {
        DrawCube(position, size, size, size, .white)
        DrawCubeWires(position, size, size, size, .darkGray)
    }
}

extension KeyboardKey {
    var asInt32: Int32 {
        Int32(self.rawValue)
    }
}
