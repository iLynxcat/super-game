@_exported import Raylib

public class GameEngine {
    public private(set) var windowWidth: Int32
    public private(set) var windowHeight: Int32
    public var windowTitle: String {
        didSet {
            SetWindowTitle(windowTitle)
        }
    }

    public var delegate: (any GameDelegate)?

    public var shouldUpdate = true
    private let alwaysUpdateLayers: [RenderLayer] = [.ui]

    #if DEBUG
        public var shouldDrawBoundingBoxes = true
    #else
        public var shouldDrawBoundingBoxes = false
    #endif

    private(set) var objects: [any GameObject] = []
    private var layeredObjects: [RenderLayer: [any GameObject]] {
        Dictionary(grouping: objects, by: { $0.renderLayer })
    }

    public init(
        withTitle title: String, width: Int32 = 800, height: Int32 = 600
    ) {
        self.windowTitle = title
        self.windowWidth = width
        self.windowHeight = height
    }

    internal func start() {
        InitWindow(windowWidth, windowHeight, windowTitle)
        SetWindowState(
            FLAG_WINDOW_RESIZABLE.rawValue
        )
        SetExitKey(KEY_NULL.asInt32)

        let targetFPS: Int32 = min(GetMonitorRefreshRate(GetCurrentMonitor()), 120)
        SetTargetFPS(targetFPS)

        for object in objects {
            object.load()
        }

        delegate?.didStart()
    }

    internal func stop() {
        delegate?.willStop()
        CloseWindow()
    }

    public func run() {
        start()
        while !WindowShouldClose() {
            update()
            draw()
        }
        stop()
    }

    internal func update() {
        delegate?.willUpdate()

        updateKeyDown()
        updateWindowSize()

        let layers = layeredObjects.keys.sorted()
        for layer in layers {
            for object in layeredObjects[layer] ?? [] {
                if alwaysUpdateLayers.contains(layer) || shouldUpdate {
                    object.update(deltaTime: GetFrameTime())
                }
            }
        }

        delegate?.didUpdate()
    }

    internal func draw() {
        BeginDrawing()

        delegate?.willDraw()

        let layers = layeredObjects.keys.sorted()

        for layer in layers {
            for object in layeredObjects[layer] ?? [] {
                object.preDraw()
            }
            for object in layeredObjects[layer] ?? [] {
                object.draw()
                if shouldDrawBoundingBoxes, let collidable = object as? Collidable {
                    DrawBoundingBox(collidable.collisionBox, .purple)
                }
            }
            for object in layeredObjects[layer] ?? [] {
                object.postDraw()
            }
        }

        delegate?.didDraw()

        EndDrawing()
    }

    private func updateWindowSize() {
        if IsWindowResized() {
            windowWidth = GetScreenWidth()
            windowHeight = GetScreenHeight()
            for object in objects {
                object.onWindowResize(width: windowWidth, height: windowHeight)
            }
        }
    }

    private func updateKeyDown() {
        let keyPressed = UInt32(GetKeyPressed())
        for object in objects {
            object.onKeyDown(key: KeyboardKey(keyPressed))
        }
    }

    public func add(_ object: any GameObject) {
        objects.append(object)
    }
}

extension GameEngine {
    public func findObject<T: GameObject>(firstOfType type: T.Type) -> T? {
        objects.first { $0 is T } as? T
    }

    public func findObjects<T: GameObject>(ofType type: T.Type) -> [T] {
        objects.compactMap { $0 as? T }
    }

    public func remove(_ object: any GameObject) {
        objects.removeAll { $0 === object }
    }

    public func removeAll() {
        objects.removeAll()
    }

    public func removeAll<T: GameObject>(ofType type: T.Type) {
        objects.removeAll { $0 is T }
    }
}
