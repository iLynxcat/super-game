import Raylib

class GameEngine {
    var windowWidth: Int32
    var windowHeight: Int32
    var title: String {
        didSet {
            SetWindowTitle(title)
        }
    }

    var shouldUpdate: Bool = true
    let alwaysUpdateLayers: [RenderLayer] = [.ui]

    private var objects: [any GameObject] = []
    private var layeredObjects: [RenderLayer: [any GameObject]] {
        Dictionary(grouping: objects, by: { $0.renderLayer })
    }

    init(width: Int32, height: Int32, title: String) {
        self.windowWidth = width
        self.windowHeight = height
        self.title = title
    }

    func start() {
        InitWindow(windowWidth, windowHeight, title)
        SetWindowState(
            FLAG_WINDOW_RESIZABLE.rawValue
        )
        SetExitKey(KEY_NULL.asInt32)

        let targetFPS: Int32 = min(GetMonitorRefreshRate(GetCurrentMonitor()), 120)
        SetTargetFPS(targetFPS)
    }

    func stop() {
        CloseWindow()
    }

    func run() {
        start()
        while !WindowShouldClose() {
            update()
            draw()
        }
        stop()
    }

    func update() {
        updateKeyPressed()
        updateWindowSize()

        let layers = layeredObjects.keys.sorted()

        for layer in layers {
            for object in layeredObjects[layer] ?? [] {
                if alwaysUpdateLayers.contains(layer) || shouldUpdate {
                    object.update(deltaTime: GetFrameTime())
                }
            }
        }
    }

    func draw() {
        BeginDrawing()
        ClearBackground(.black)

        let layers = layeredObjects.keys.sorted()

        for layer in layers {
            for object in layeredObjects[layer] ?? [] {
                object.preDraw()
            }
            for object in layeredObjects[layer] ?? [] {
                object.draw()
            }
            for object in layeredObjects[layer] ?? [] {
                object.postDraw()
            }
        }

        EndDrawing()
    }

    func updateWindowSize() {
        if IsWindowResized() {
            windowWidth = GetScreenWidth()
            windowHeight = GetScreenHeight()
            for object in objects {
                object.onWindowResize(width: windowWidth, height: windowHeight)
            }
        }
    }

    func updateKeyPressed() {
        let keyPressed = UInt32(GetKeyPressed())
        for object in objects {
            object.onKeyDown(key: KeyboardKey(keyPressed))
        }
    }

    func add(_ object: any GameObject) {
        objects.append(object)
    }
}

extension GameEngine {
    func findObject<T: GameObject>(firstOfType type: T.Type) -> T? {
        objects.first { $0 is T } as? T
    }

    func findObjects<T: GameObject>(ofType type: T.Type) -> [T] {
        objects.compactMap { $0 as? T }
    }

    func remove(_ object: any GameObject) {
        objects.removeAll { $0 === object }
    }

    func removeAll() {
        objects.removeAll()
    }

    func removeAll<T: GameObject>(ofType type: T.Type) {
        objects.removeAll { $0 is T }
    }
}
