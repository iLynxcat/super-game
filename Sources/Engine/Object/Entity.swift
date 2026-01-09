open class Entity: GameObject, Updatable {
    public var location: Vector3
    public var pitch: Float = 0 {
        didSet {
            pitch = max(-Float.pi / 2 + 0.01, min(Float.pi / 2 - 0.01, pitch))
        }
    }
    public var yaw: Float = 0

    public init(at location: Vector3) {
        self.location = location
    }

    open func update(context: UpdateContext) {}

    public var forwardVector: Vector3 {
        Vector3(
            cos(yaw) * cos(pitch),
            sin(pitch),
            sin(yaw) * cos(pitch)
        ).normalized
    }

    public var rightVector: Vector3 {
        Vector3(-sin(yaw), 0, cos(yaw)).normalized
    }

    public func move(direction: Vector3, amount: Float) {
        location += direction * amount
    }
}

open class LivingEntity: Entity {
    open var eyeHeight: Float
    public var eyeLocation: Vector3 {
        location + Vector3(0, eyeHeight, 0)
    }

    public init(at location: Vector3, eyeHeight: Float) {
        self.eyeHeight = eyeHeight

        super.init(at: location)
    }
}
