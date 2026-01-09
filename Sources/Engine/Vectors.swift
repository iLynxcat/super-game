import Foundation

@_exported import struct Raylib.BoundingBox
@_exported import struct Raylib.Quaternion
@_exported import struct Raylib.Vector2
@_exported import struct Raylib.Vector3
@_exported import struct Raylib.Vector4

extension Vector2 {
    public static let zero = Self(0, 0)

    public init(_ x: Float, _ y: Float) {
        self.init(x: x, y: y)
    }
}

extension Vector3: AdditiveArithmetic {
    public static let zero = Self(0, 0, 0)

    public init(_ x: Float, _ y: Float, _ z: Float) {
        self.init(x: x, y: y, z: z)
    }

    public var length: Float {
        sqrt((pow(x, 2) + pow(y, 2) + pow(z, 2)))
    }

    public var normalized: Self {
        let length = self.length
        guard length > 0 else { return self }
        return self / length
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }

    public static func + (lhs: Self, rhs: Self) -> Self {
        Self(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
    }

    public static func - (lhs: Self, rhs: Self) -> Self {
        Self(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
    }

    public static func * (lhs: Self, rhs: Self) -> Self {
        Self(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z)
    }

    public static func * (lhs: Self, rhs: Float) -> Self {
        Self(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
    }

    public static func * (lhs: Float, rhs: Self) -> Self {
        Self(rhs.x * lhs, rhs.y * lhs, rhs.z * lhs)
    }

    public static func / (lhs: Self, rhs: Self) -> Self {
        Self(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z)
    }

    public static func / (lhs: Self, rhs: Float) -> Self {
        Self(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
    }
}

extension Vector4 {
    public static let zero = Self(0, 0, 0, 0)

    public init(_ x: Float, _ y: Float, _ z: Float, _ w: Float) {
        self.init(x: x, y: y, z: z, w: w)
    }
}
