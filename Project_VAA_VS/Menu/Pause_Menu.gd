extends CanvasLayer

var pause = false

func _ready():
	$Control.hide()

func _process(delta):
	if Input.is_action_just_pressed("Esc"):
		if !pause:
			$Control.show()
			get_tree().paused = true
			pause = true
		else:
			$Control.hide()
			get_tree().paused = false
			pause = false


# Save_Game
const SAVE_PATH = "user://data_game.json"

func _on_Save_Game_pressed():
	var file = File.new()
	file.open(SAVE_PATH, File.WRITE)

	var save_dict = {
		Map = {
			map = var2str(MapData.map),
			screen = var2str(MapData.screen),
			sound = var2str(MapData.sound)
		}
	}

	file.store_line(to_json(save_dict))


func _on_Back_pressed():
	$Control.hide()
	get_tree().paused = false
	pause = false


func _on_Home_pressed():
	_on_Save_Game_pressed()
	
	$Control.hide()
	get_tree().paused = false
	pause = false
	
	get_tree().change_scene("res://Menu/Main_Menu.tscn")




func _on_Quit_pressed():
	_on_Save_Game_pressed()
	
	get_tree().quit()
