import Raylib

public typealias Color = Raylib.Color
extension Color {
    public static let white = Color(255, 255, 255, 255)
    public static let black = Color(0, 0, 0, 255)

    public init(_ r: UInt8, _ g: UInt8, _ b: UInt8, _ a: UInt8 = 255) {
        self.init(r: r, g: g, b: b, a: a)
    }

    public func with(opacity: UInt8) -> Color {
        Color(self.r, self.g, self.b, opacity)
    }
}
