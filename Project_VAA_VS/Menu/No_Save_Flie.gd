extends CanvasLayer




func _on_New_Game_pressed():
	get_tree().change_scene("res://Videos/Intro_Map_1.tscn")


func _on_Back_pressed():
	$No_Save_Flie.hide()
