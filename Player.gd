extends Spatial

# Durée d'un changement de couloir
const DUREE_TRANSITION = 0.15

#durrée d'un saut
const DUREE_SAUT = 0.5
const HAUTEUR_SAUT = 2.5

# coordonnées en X de chaque couloir
var couloirs = []
# couloir courant
var couloirCourant:int = 2
#couloir à atteindre
var couloirCible:int = couloirCourant

var yOrigine;
# Flag saut
var jump = false;

var delayTransition = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	var groundContent = get_node("../Ground").get_children()
	for c in groundContent :
		couloirs.append(c.translation.x);
	translation.x = couloirs[couloirCourant]
	yOrigine = translation.y
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if couloirCible != couloirCourant and !jump :
		var progress
		if couloirCourant < couloirCible :
			progress = lerp(couloirs[couloirCourant], couloirs[couloirCible], delayTransition / DUREE_TRANSITION);
		else :
			progress = lerp(couloirs[couloirCible], couloirs[couloirCourant], 1-delayTransition / DUREE_TRANSITION);
			
		translation.x = progress
		
			
		if delayTransition >= DUREE_TRANSITION :
			couloirCourant = couloirCible
			translation.x = couloirs[couloirCourant]
			delayTransition = 0
		else :
			delayTransition += delta
	
	if couloirCible == couloirCourant :
		if Input.is_action_pressed("ui_left") :
			couloirCible = max(0, couloirCourant -1)
		elif Input.is_action_pressed("ui_right") :
			couloirCible = min(couloirCourant+1, couloirs.size() - 1)
		elif Input.is_action_pressed("ui_accept") and !jump :
			jump = true;
			get_node("JumpSound").play()	

	if jump :
		if delayTransition >= DUREE_SAUT :
			translation.y = yOrigine
			delayTransition = 0
			jump = false
		elif delayTransition >= DUREE_SAUT / 2 :
			translation.y = lerp(yOrigine, yOrigine + HAUTEUR_SAUT,  ((DUREE_SAUT - delayTransition) / (DUREE_SAUT / 2)))
			delayTransition += delta
		else :
			translation.y = lerp(yOrigine, yOrigine + HAUTEUR_SAUT, delayTransition / (DUREE_SAUT / 2))
			delayTransition += delta
		
