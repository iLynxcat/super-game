import Raylib

class GameEngine {
    private let windowWidth: Int32
    private let windowHeight: Int32
    var title: String {
        didSet {
            SetWindowTitle(title)
        }
    }

    private var objects: [any GameObject] = []

    init(width: Int32, height: Int32, title: String) {
        self.windowWidth = width
        self.windowHeight = height
        self.title = title
    }

    func start() {
        InitWindow(windowWidth, windowHeight, title)
        SetTargetFPS(60)
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
        for object in objects {
            object.update(deltaTime: GetFrameTime())
        }
    }

    func draw() {
        BeginDrawing()
        ClearBackground(.black)

        let layeredObjects = Dictionary(grouping: objects, by: { $0.renderLayer })
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
