import Engine
import Foundation

class Camera: GameObject3D {
    var camera: Camera3D
    var position: Vector3 {
        didSet {
            camera.position = position
        }
    }
    var target: PlayerFirstPerson {
        didSet {
            camera.target = target.position
        }
    }

    var up = Vector3(x: 0, y: 1, z: 0)
    var fov: Float = 60.0
    var projection: CameraProjection = .perspective

    private(set) var pitch: Float = 0.0 {
        didSet {
            let maxPitch = Float.pi / 2 - 0.01
            pitch = max(-maxPitch, min(maxPitch, pitch))
        }
    }
    private(set) var yaw: Float = -Float.pi / 2
    let mouseSensitivity: Float = 0.002

    init(target: PlayerFirstPerson) {
        self.target = target
        self.position = target.eyePosition
        self.camera = Camera3D(
            position: position,
            target: Vector3(
                x: target.eyePosition.x, y: target.eyePosition.y, z: target.eyePosition.z - 1),
            up: up,
            fovy: fov,
            projection: projection.asInt32
        )
    }

    func update(deltaTime: Float) {
        position = target.eyePosition

        let mouseDelta = GetMouseDelta()
        yaw += mouseDelta.x * mouseSensitivity
        pitch -= mouseDelta.y * mouseSensitivity

        let perspectiveX = cos(pitch) * cos(yaw)
        let perspectiveY = sin(pitch)
        let perspectiveZ = cos(pitch) * sin(yaw)

        camera.target = Vector3(
            x: position.x + perspectiveX,
            y: position.y + perspectiveY,
            z: position.z + perspectiveZ
        )
    }

    func getForwardDirection() -> Vector3 {
        let forward = Vector3(
            x: cos(yaw),
            y: 0,
            z: sin(yaw)
        )
        return normalize(forward)
    }

    func getRightDirection() -> Vector3 {
        let right = Vector3(
            x: -sin(yaw),
            y: 0,
            z: cos(yaw)
        )
        return normalize(right)
    }

    private func normalize(_ vector: Vector3) -> Vector3 {
        let length = sqrt((pow(vector.x, 2) + pow(vector.y, 2) + pow(vector.z, 2)))
        guard length > 0 else { return vector }
        return Vector3(x: vector.x / length, y: vector.y / length, z: vector.z / length)
    }

    func preDraw() {
        BeginMode3D(camera)
    }

    func draw() {
        DrawPlane(.init(x: 0, y: 0, z: 0), .init(x: 256, y: 256), .darkGray)
    }

    func postDraw() {
        EndMode3D()
    }
}
