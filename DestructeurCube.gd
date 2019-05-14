extends Spatial

onready var game = get_node("/root/Game")
onready var soundPlayer = get_node("AudioStreamPlayer3D")

func _on_Area_body_entered(body):
	
	if body.is_in_group("Obstacle") :
		game.incScore(100)
		body.queue_free()
		if soundPlayer.playing:
			soundPlayer.stop()
		soundPlayer.translation.x = body.translation.x
		soundPlayer.play()
	