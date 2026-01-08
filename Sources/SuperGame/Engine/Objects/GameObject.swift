import Raylib

protocol GameObject3D: GameObject {
    var position: Vector3 { get set }
}

extension GameObject3D {
    var renderLayer: RenderLayer { .world3D }
}
