extends Spatial

var obstacle_scene = preload("res://Obstacle.tscn")
	
func generer():
	var newChild = obstacle_scene.instance()
	add_child(newChild)
		
