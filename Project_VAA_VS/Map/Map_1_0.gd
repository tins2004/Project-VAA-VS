extends Node2D

var key = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Next_Map_body_entered(body):
	if body.name == "Player" and key >= 1:
		get_tree().change_scene("res://Map/Map_2_0.tscn")


func _on_Save_Map_body_exited(body):
	MapData.map = 1


func _on_Key_body_entered(body):
	if body.name == "Player":
		key += 1
	
	$Key.hide()
	$Key/CollisionShape2D.disabled = true
