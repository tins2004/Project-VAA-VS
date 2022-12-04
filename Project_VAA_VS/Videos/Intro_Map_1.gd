extends VideoPlayer

var time = 0

func _process(delta):
	time += delta
	
	var sec = fmod(time,60)
	
	if sec >= 3:
		get_tree().change_scene("res://Map/Map_1_0.tscn")
		
	$Label.text = str(sec)
