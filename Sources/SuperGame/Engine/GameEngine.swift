import Raylib

class GameEngine {
    let windowWidth: Int32
    let windowHeight: Int32
    var title: String {
        willSet {
            SetWindowTitle(title)
        }
    }

    private(set) var objects: [any GameObject] = []

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

        for object in objects {
            object.preDraw()
        }
        for object in objects {
            object.draw()
        }
        for object in objects {
            object.postDraw()
        }

        EndDrawing()
    }

    func add(_ object: any GameObject) {
        objects.append(object)
    }
}
