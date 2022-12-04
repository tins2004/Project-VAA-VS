extends Node2D

var key = 0


func _on_Next_Map_body_entered(body):
	if body.name == "Player" and key >= 2:
		get_tree().change_scene("res://Map/Map_3_0.tscn")


func _on_Save_Map_body_exited(body):
	MapData.map = 2


func _on_Key_body_entered(body):
	if body.name == "Player":
		key += 1
	
	$Key.hide()
	$Key/CollisionShape2D.disabled = true

func _on_Key2_body_entered(body):
	if body.name == "Player":
		key += 1
	
	$Key2.hide()
	$Key2/CollisionShape2D.disabled = true
