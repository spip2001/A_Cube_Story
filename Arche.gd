extends Spatial

onready var game = get_node("/root/Game")

func _physics_process(delta):
	var speed = game.speed;
	translation.z += speed * delta
	
	if translation.z > 200 :
		free()
