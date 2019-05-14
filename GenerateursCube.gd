extends Spatial

var delay = 1.0

var time = 0;

var patterns = [
	[0,1,2,3,4],
	[0,1,  3,4],
	[0,  2,  4],
	[  1,2,3  ],
	[0,      4],
	[  1,  3  ]]

func _process(delta):
	time += delta
	if time >= delay:
		var pattern = patterns[randi() % patterns.size()]
		for i in pattern :
			get_child(i).generer()
		time = 0
	


