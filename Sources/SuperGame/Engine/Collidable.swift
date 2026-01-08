import Raylib

protocol Collidable: AnyObject {
    var collisionBox: BoundingBox { get }
}

extension Collidable {
    func collides(with other: any Collidable) -> Bool {
        return CheckCollisionBoxes(self.collisionBox, other.collisionBox)
    }
}

extension BoundingBox {
    init(center: Vector3, size: Vector3) {
        self.init(
            min: Vector3(
                x: center.x - size.x / 2,
                y: center.y - size.y / 2,
                z: center.z - size.z / 2
            ),
            max: Vector3(
                x: center.x + size.x / 2,
                y: center.y + size.y / 2,
                z: center.z + size.z / 2
            )
        )
    }
}
