import Raylib

class Camera: GameObject {
    var camera: Camera3D
    var position = Vector3(x: 0, y: 100, z: 150)
    var target: any GameObject

    var up = Vector3(x: 0, y: 1, z: 0)
    var fov: Float = 45.0
    var projection: CameraProjection = .perspective

    init(target: GameObject) {
        self.target = target
        self.camera = Camera3D(
            position: position,
            target: self.target.position,
            up: up,
            fovy: fov,
            projection: projection.raw
        )
    }

    func update(deltaTime: Float) {
        camera.target = target.position
    }

    func preDraw() {
        BeginMode3D(camera)
    }

    func draw() {
        DrawGrid(20, 10.0)
    }

    func postDraw() {
        EndMode3D()
    }
}

extension CameraProjection {
    var raw: Int32 {
        Int32(self.rawValue)
    }

    static let orthographic = CAMERA_ORTHOGRAPHIC
    static let perspective = CAMERA_PERSPECTIVE
}
