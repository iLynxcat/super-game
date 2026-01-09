import Foundation
import Raylib

public class Camera: Updatable, Drawable {
    public let layer: Int = 0  // TODO: this should only be specified by subclasses!

    internal private(set) var camera: Raylib.Camera3D
    private var up = Vector3(0, 1, 0) {
        didSet {
            camera.up = up
        }
    }

    public private(set) var pitch: Float = 0
    public private(set) var yaw: Float = 0

    public private(set) var target: (any LivingEntity)? {
        didSet {
            if let target { updateVectors(target: target) }
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

    public func update(context: UpdateContext) {
        guard let target else { return }
        updateVectors(target: target)
    }

    private func updateVectors(target: any LivingEntity) {
        camera.position = target.eyeLocation
        camera.target = camera.position + forwardVector

    }

    public var forwardVector: Vector3 {
        normalize(Vector3(cos(yaw), 0, sin(yaw)))
    }

    public var rightVector: Vector3 {
        normalize(Vector3(-sin(yaw), 0, cos(yaw)))
    }

    private func normalize(_ vector: Vector3) -> Vector3 {
        let length = vector.length
        guard length > 0 else { return vector }
        return vector / length
    }

    public func preDraw(context: DrawContext) {
        Raylib.BeginMode3D(camera)
    }
    public func draw(context: DrawContext) {}
    public func postDraw(context: DrawContext) {
        Raylib.EndMode3D()
    }

}

public enum CameraProjection {
    case perspective
    case orthographic

    fileprivate var asRaylibProjection: Int32 {
        switch self {
        case .perspective:
            Int32(Raylib.CAMERA_PERSPECTIVE.rawValue)
        case .orthographic:
            Int32(Raylib.CAMERA_ORTHOGRAPHIC.rawValue)
        }
    }
}
