import Engine

let game = Game(windowTitle: "Super Game")

let player = Player()
let camera = Camera(target: player, fov: 120)

game.objects.append(Backdrop())
game.objects.append(camera)
game.objects.append(player)

game.run()
