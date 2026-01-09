import Raylib

public struct Input {
    public let keyboard: KeyboardInput
    public let mouse: MouseInput

    public init(keyboard: KeyboardInput, mouse: MouseInput) {
        self.keyboard = keyboard
        self.mouse = mouse
    }

    public static func capture() -> Input {
        Input(
            keyboard: KeyboardInput.capture(),
            mouse: MouseInput.capture()
        )
    }
}

public struct KeyboardInput {
    private let pressedKeys: Set<Int32>

    private init(pressedKeys: Set<Int32>) {
        self.pressedKeys = pressedKeys
    }

    public func isKeyDown(_ key: KeyboardKey) -> Bool {
        pressedKeys.contains(key.rawValue)
    }

    public static func capture() -> KeyboardInput {
        var pressed = Set<Int32>()

        let keysToCheck: [Int32] = [
            Raylib.KEY_W, Raylib.KEY_A,
            Raylib.KEY_S, Raylib.KEY_D,
            Raylib.KEY_SPACE, Raylib.KEY_LEFT_SHIFT,
            Raylib.KEY_LEFT_CONTROL, Raylib.KEY_ESCAPE,
        ].map { Int32($0.rawValue) }

        for key in keysToCheck {
            if Raylib.IsKeyDown(key) {
                pressed.insert(key)
            }
        }

        return KeyboardInput(pressedKeys: pressed)
    }
}

public struct MouseInput {
    public let delta: Vector2
    public let position: Vector2
    public let leftButton: Bool
    public let rightButton: Bool

    public static func capture() -> MouseInput {
        MouseInput(
            delta: Raylib.GetMouseDelta(),
            position: Raylib.GetMousePosition(),
            leftButton: Raylib.IsMouseButtonDown(Int32(Raylib.MOUSE_BUTTON_LEFT.rawValue)),
            rightButton: Raylib.IsMouseButtonDown(Int32(Raylib.MOUSE_BUTTON_RIGHT.rawValue))
        )
    }
}

public enum KeyboardKey {
    case w, a, s, d
    case space, shift, control
    case escape

    public var rawValue: Int32 {
        switch self {
        case .w: Int32(Raylib.KEY_W.rawValue)
        case .a: Int32(Raylib.KEY_A.rawValue)
        case .s: Int32(Raylib.KEY_S.rawValue)
        case .d: Int32(Raylib.KEY_D.rawValue)
        case .space: Int32(Raylib.KEY_SPACE.rawValue)
        case .shift: Int32(Raylib.KEY_LEFT_SHIFT.rawValue)
        case .control: Int32(Raylib.KEY_LEFT_CONTROL.rawValue)
        case .escape: Int32(Raylib.KEY_ESCAPE.rawValue)
        }
    }
}
