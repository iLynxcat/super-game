import Raylib

extension Color {
    public static let white = Color(r: 255, g: 255, b: 255, a: 255)
    public static let darkGray = Color(r: 64, g: 64, b: 64, a: 255)
    public static let black = Color(r: 0, g: 0, b: 0, a: 255)
    public static let red = Color(r: 255, g: 0, b: 0, a: 255)
    public static let purple = Color(r: 128, g: 0, b: 128, a: 255)

    public func withOpacity(_ opacity: UInt8) -> Color {
        Color(r: self.r, g: self.g, b: self.b, a: opacity)
    }
}
