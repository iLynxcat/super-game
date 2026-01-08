public enum RenderLayer: Int, Comparable {
    case background = 0
    case world3D, world2D, ui

    public static func < (lhs: RenderLayer, rhs: RenderLayer) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension CameraProjection {
    public var asInt32: Int32 {
        Int32(self.rawValue)
    }

    public static let orthographic = CAMERA_ORTHOGRAPHIC
    public static let perspective = CAMERA_PERSPECTIVE
}
