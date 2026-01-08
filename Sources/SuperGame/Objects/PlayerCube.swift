import Raylib

class PlayerCube: GameObject, Positionable {
    let size: Float = 50.0
    let speed: Float = 2.0
    var position = Vector3(x: 0, y: 25, z: 0)

    func update(deltaTime: Float) {
        if IsKeyDown(KEY_W.key) {
            position.z -= speed
        }
        if IsKeyDown(KEY_S.key) {
            position.z += speed
        }
        if IsKeyDown(KEY_A.key) {
            position.x -= speed
        }
        if IsKeyDown(KEY_D.key) {
            position.x += speed
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
