import Raylib

class GameEngine {
    var objects: [any GameObject] = []

    func update(deltaTime: Float) {
        for object in objects {
            object.update(deltaTime: deltaTime)
        }
    }

    func draw() {
        BeginDrawing()

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
