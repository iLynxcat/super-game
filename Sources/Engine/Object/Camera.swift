import Foundation
import Raylib

public class Camera: Updatable {
    internal private(set) var camera: Raylib.Camera3D
    private var up = Vector3(0, 1, 0) {
        didSet {
            camera.up = up
        }
    }

    public private(set) var target: (any LivingEntity)? {
        didSet {
            camera.position = target?.eyeLocation ?? camera.position
            camera.target = target?.eyeLocation ?? camera.target
        }
    }
    public var fov: Float {
        didSet {
            camera.fovy = fov
        }
    }
    public var projection: CameraProjection = .perspective {
        didSet {
            camera.projection = projection.asRaylibProjection
        }
    }

    public init(fixedPosition pos: Vector3, fov: Float = 45.0) {
        self.fov = fov
        self.camera =
            Raylib.Camera3D(
                position: pos,
                target: pos,
                up: up,
                fovy: fov,
                projection: projection.asRaylibProjection
            )
    }

    public init(target: any LivingEntity, fov: Float = 45.0) {
        self.target = target
        self.fov = fov
        self.camera =
            Raylib.Camera3D(
                position: target.eyeLocation,
                target: target.eyeLocation,
                up: up,
                fovy: fov,
                projection: projection.asRaylibProjection
            )
    }

    public func update(deltaTime: TimeInterval) {
        guard let target else { return }

        camera.position = target.eyeLocation
        camera.target = target.eyeLocation
    }
}

public enum CameraProjection {
    case perspective
    case orthographic

    internal var asRaylibProjection: Int32 {
        switch self {
        case .perspective:
            Int32(Raylib.CAMERA_PERSPECTIVE.rawValue)
        case .orthographic:
            Int32(Raylib.CAMERA_ORTHOGRAPHIC.rawValue)
        }
    }
}
