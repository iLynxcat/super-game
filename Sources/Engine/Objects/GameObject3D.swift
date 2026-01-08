import Raylib

public protocol GameObject3D: GameObject {
    var position: Vector3 { get set }
}

extension GameObject3D {
    public var renderLayer: RenderLayer { .world3D }
}
