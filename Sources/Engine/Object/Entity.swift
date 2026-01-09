public protocol Entity: GameObject, Updatable {
    var location: Vector3 { get }
}

public protocol LivingEntity: Entity {
    var eyeLocation: Vector3 { get }
}
