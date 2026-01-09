import Engine

class Player: LivingEntity {
    var eyeLocation: Vector3 {
        location + Vector3(0, 1.8, 0)
    }
    var location = Vector3(0, 0, 25)

    func update(deltaTime: TimeInterval) {
    }
}
