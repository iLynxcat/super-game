enum RenderLayer: Int, Comparable {
    case background = 0
    case world3D, world2D, ui

    static func < (lhs: RenderLayer, rhs: RenderLayer) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
