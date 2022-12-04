extends Area2D


var key = 0

func _ready():
	$Label.hide()
	$Label2.hide()



func _on_NPC_Map_1_0_body_entered(body):
	if body.name == "Player"or body.name == "Player_02":
		if key == 0:
			$Label.show()
		else:
			$Label2.show()
			


func _on_NPC_Map_1_0_body_exited(body):
	if body.name == "Player" or body.name == "Player_02":
		$Label.hide()
		$Label2.hide()



func _on_Key_body_entered(body):
	if body.name == "Player" or body.name == "Player_02":
		key += 1
