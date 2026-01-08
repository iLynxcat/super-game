import Raylib

class PlayerCube: GameObject3D {
    let size: Float = 50.0
    let speed: Float = 100.0  // units per second
    var position = Vector3(x: 0, y: 25, z: 0)

    func update(deltaTime: Float) {
        let movement = speed * deltaTime

        if IsKeyDown(KEY_W.key) {
            position.z -= movement
        }
        if IsKeyDown(KEY_S.key) {
            position.z += movement
        }
        if IsKeyDown(KEY_A.key) {
            position.x -= movement
        }
        if IsKeyDown(KEY_D.key) {
            position.x += movement
        }
    }

    func draw() {
        DrawCube(position, size, size, size, .white)
        DrawCubeWires(position, size, size, size, .darkGray)
    }
}

extension KeyboardKey {
    var key: Int32 {
        Int32(self.rawValue)
    }
}
