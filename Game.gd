extends Spatial

onready var labelScore = get_node("GUI/VBoxContainer/LabelScore")
onready var labelVies = get_node("GUI/VBoxContainer/LabelVies")
onready var labelGameOver = get_node("GUI/VBoxContainer/Grid/LabelGameOver")
onready var decorDefilant = get_node("DecorDefilant")
onready var generateurs = get_node("GenerateursCube")
onready var camera = get_node("Player/Camera")
onready var playerAudio = get_node("Player/HitSound")

var speed = 100
var lvl = 1
var score = 0
var lifes = 3
var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	labelScore.text = "SCORE : " + str(score)
	labelVies.text = "VIES : " + str(lifes)
	gameOver()
	
func incScore(val) :
	score += val
	labelScore.text = "SCORE : " + str(score)
	if lvl * 5000 <= score :
		lvl += 1
		speed += 5
		decorDefilant.delay = max (0.25, decorDefilant.delay - 0.25)
		generateurs.delay = max (0.5, decorDefilant.delay - 0.25)


func _on_Player_collision(body):
	if body.is_in_group("Obstacle") :
		lifes -= 1
		camera.shake()
		labelVies.text = "VIES : " + str(lifes)
		body.queue_free()
		
		if playerAudio.playing:
			playerAudio.stop()
		playerAudio.play()
		
		if lifes == 0 :
			gameOver()
	
func startGame():
	speed = 100
	lvl = 1
	score = 0
	lifes = 3
	labelScore.text = "SCORE : " + str(score)
	labelVies.text = "VIES : " + str(lifes)
	get_tree().paused = false
	gameOver = false
	labelGameOver.visible = false
	generateurs.delay = 1.0
	decorDefilant.delay = 1.5
	for o in get_tree().get_nodes_in_group("Obstacle") :
		o.queue_free()
	
func gameOver():
	gameOver = true
	labelGameOver.visible = true
	get_tree().paused = true
	pass
	
