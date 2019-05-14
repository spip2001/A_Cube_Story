extends Label

onready var game = get_node("/root/Game");

func _process(delta):
	if game.gameOver and Input.is_key_pressed(KEY_S) :
		game.startGame()
