import Foundation
import Raylib

open class GameCamera: Updatable, Drawable {
    open var layer: Int { -1 }  // TODO: this should only be specified by subclasses!

    internal private(set) var camera: Raylib.Camera3D
    private var up = Vector3(0, 1, 0) {
        didSet {
            camera.up = up
        }
    }

    public private(set) var target: LivingEntity? {
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
                target: pos + Vector3(0, 0, -1),
                up: up,
                fovy: fov,
                projection: projection.asRaylibProjection
            )
    }

    public init(target: LivingEntity, fov: Float = 45.0) {
        self.target = target
        self.fov = fov
        self.camera =
            Raylib.Camera3D(
                position: target.eyeLocation,
                target: target.eyeLocation + Vector3(0, 0, -1),
                up: up,
                fovy: fov,
                projection: projection.asRaylibProjection
            )
    }

    public func update(context: UpdateContext) {
        guard let target else { return }
        updateVectors(target: target)
    }

    private func updateVectors(target: LivingEntity) {
        camera.position = target.eyeLocation
        camera.target = camera.position + target.forwardVector
    }

    public func preDraw(context: DrawContext) {
        Raylib.BeginMode3D(camera)
    }
    open func draw(context: DrawContext) {}
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
