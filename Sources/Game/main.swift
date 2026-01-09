import Engine

let game = Game(windowTitle: "Super Game")

let player = Player()

game.objects.append(Backdrop())
game.objects.append(Camera(target: player, fov: 120))
game.objects.append(player)

game.run()
