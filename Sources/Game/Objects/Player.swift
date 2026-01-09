import Engine

class Player: LivingEntity {
    var layer: Int { DrawLayer.world.rawValue }

    private var mouseSensitivity: Float = 0.002
    private var moveSpeed: Float = 10.0
    private var sprintMultiplier: Float = 2.0

    init() {
        super.init(at: Vector3(0, 0, -25), eyeHeight: 1.8)
    }

    override func update(context: UpdateContext) {
        handleRotation(context: context)
        handleMovement(context: context)
    }

    private func handleRotation(context: UpdateContext) {
        yaw -= context.input.mouse.delta.x * mouseSensitivity
        pitch -= context.input.mouse.delta.y * mouseSensitivity
    }

    private func handleMovement(context: UpdateContext) {
        let input = context.input.keyboard

        var moveDirection = Vector3.zero
        let horizontalForward = Vector3(cos(yaw), 0, sin(yaw)).normalized

        if input.isKeyDown(.w) {
            moveDirection = moveDirection + horizontalForward
        }
        if input.isKeyDown(.s) {
            moveDirection = moveDirection - horizontalForward
        }
        if input.isKeyDown(.a) {
            moveDirection = moveDirection - rightVector
        }
        if input.isKeyDown(.d) {
            moveDirection = moveDirection + rightVector
        }

        if moveDirection.length > 0 {
            moveDirection = moveDirection.normalized
        }

        var speed = moveSpeed
        if input.isKeyDown(.shift) {
            speed *= sprintMultiplier
        }

        if moveDirection != .zero {
            move(direction: moveDirection, amount: speed * Float(context.deltaTime))
        }
    }
}
