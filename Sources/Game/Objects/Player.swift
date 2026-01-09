import Engine

class Player: LivingEntity {
    var layer: Int { DrawLayer.world.rawValue }

    private var mouseSensitivity: Float = 0.01  // rad/px

    init() {
        super.init(at: Vector3(0, 0, -25), eyeHeight: 18)
    }

    override func update(context: UpdateContext) {
    }
}
