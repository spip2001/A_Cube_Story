extends Camera

const SHAKING_DURATION = 0.15

var shaking = false
var shakingTimer = 0
var initialTranslation

# Called when the node enters the scene tree for the first time.
func _ready():
	initialTranslation = Vector3(translation.x, translation.y, translation.z)
	
func _process(delta):
	if shaking :
		translation = translation + Vector3(rand_range(-0.2,0.2),rand_range(-0.2,0.2),rand_range(-0.1,0.1))
		shakingTimer += delta
		if shakingTimer >= SHAKING_DURATION :
			shaking = false
			shakingTimer = 0
			translation = initialTranslation
	
func shake() :
	shaking = true
	shakingTimer = 0
	
