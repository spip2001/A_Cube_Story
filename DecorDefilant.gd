extends Spatial

var arche_scene = preload("res://Arche.tscn")

var delay = 1.500

var time = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(arche_scene.instance())
	

func _physics_process(delta):
	time += delta
	if time >= delay :
		add_child(arche_scene.instance())
		time = 0
