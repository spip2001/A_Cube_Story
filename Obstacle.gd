extends Spatial

onready var game = get_node("/root/Game")

func _process(delta):
	var speed = game.speed;
	translation.z += speed * delta
	
