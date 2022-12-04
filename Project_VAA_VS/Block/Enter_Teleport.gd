extends Node2D

var Exit_Teleport

func _ready():
	Exit_Teleport = get_node("Exit_Teleport").get_global_position()



func _on_Area2D_body_entered(body):
	if body.name == "Player" or body.name == "Player_02":
		body.set_position(Exit_Teleport)
