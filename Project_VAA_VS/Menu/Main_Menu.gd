extends Control



const SAVE_PATH = "user://data_game.json"
var map = 0
var On_Full_Screen = true
var screen = 0
var sound = 0

func _ready():
	$No_Save_Flie/No_Save_Flie.hide()
	
	var file = File.new()
	file.open(SAVE_PATH, File.READ)
	var save_dict = parse_json(file.get_line())
	
	map = str2var(save_dict.Map.map)
	screen = str2var(save_dict.Map.screen)
	sound = str2var(save_dict.Map.sound)
	
	
	if screen == 0:
		OS.window_fullscreen = !OS.window_fullscreen
	if screen == 1:
		pass
	
	$VBoxContainer/HBoxContainer/VBoxContainer/HSlider.value = sound

func _on_Start_Button_pressed():
	get_tree().change_scene("res://Videos/Intro_Map_1.tscn")



func _on_Exit_Button_pressed():
	get_tree().quit()


func _on_HSlider_value_changed(value):
	if value == -20:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),-80)
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
	
	MapData.sound = value
	




# Load_game
func _on_Load_Button_pressed():
	if map == 0:
		$No_Save_Flie/No_Save_Flie.show()
	elif map == 1:
		get_tree().change_scene("res://Videos/Intro_Map_1.tscn")
	elif map == 2:
		get_tree().change_scene("res://Map/Map_2_0.tscn")
	elif map == 3:
		get_tree().change_scene("res://Map/Map_3_0.tscn")


#Set screen
func _on_Full_Screen_pressed():
	if On_Full_Screen:
		OS.window_fullscreen = !OS.window_fullscreen
		On_Full_Screen = false
		MapData.screen = 1
	else:
		OS.window_fullscreen = !OS.window_fullscreen
		On_Full_Screen = true
		MapData.screen = 0

