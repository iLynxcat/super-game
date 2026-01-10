import Engine

let game = Game(windowTitle: "Super Game")

let player = Player()

game.objects.append(Backdrop())
game.objects.append(Camera(target: player, fov: 120))
game.objects.append(player)
game.objects.append(
    Prop(modelPath: "Assets/castle.obj", texturePath: "Assets/castle_diffuse.png", at: .zero))

game.run()
