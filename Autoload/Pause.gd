extends CanvasLayer

var past = -1
var options = ["Continue", "Restart", "Menu"]
var choice = 0
var bgm_helper = 0
var is_shown = false


func _ready():
	past = 0
	_show(false)
	toggle_arrow(options[choice],false)
#	load_file()
#	if dict && dict["Master"]:
#		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),dict["Master"])
#		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BGM"),dict["BGM"])
#		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),dict["SFX"])
#	var settings = get_audio_settings()
#	if settings:	
#		for x in settings:
#			AudioServer.set_bus_volume_db(AudioServer.get_bus_index(x),settings[x])
##
func _input(event):
	if event.is_action_pressed("pause"):
		var tree = get_tree()		
		if tree.current_scene.get_name() == "MainMenu" || tree.current_scene.get_name() == "Options" || tree.paused:
			return
		else:
			tree.paused = true
			_show(true)
	elif is_shown && (event.is_action_pressed("crouch") || event.is_action_pressed("ui_down")):
		play_sound("Select")
		if choice < options.size() -1:
			choice += 1
		else:
			choice = 0
		toggle_arrow(options[past],true)
		past = choice
		toggle_arrow(options[choice],false)
	elif is_shown && event.is_action_pressed("ui_accept"):
		var tree = get_tree()
		play_sound("Enter")
		tree.paused = false
		_show(false)
		match options[choice]:
			"Menu":
				tree.change_scene("res://GUI/MainMenu.tscn")
				bgm_helper = 0
			"Restart":
				tree.change_scene("res://Levels/"+tree.current_scene.get_name()+".tscn")		
				bgm_helper = 0
				
func toggle_arrow(node,hide):
	var sprite = get_node("Control/CenterContainer/VBoxContainer/"+node+"/Sprite")
	if hide:	
		sprite.hide()
	else:
		sprite.show()

func play_sound(input):
	get_node(input).play()

func _show(_bool):
	is_shown = _bool
	if _bool:
		get_child(0).show()
	else:
		get_child(0).hide()
#
#func load_file():
#	var file = File.new()
#	if ! file.file_exists("user://savegame.save"):
#		dict = null
#		return dict
#	else:
#		var x = 0
#		file.open("user://savegame.save", File.READ)
#		var aa = parse_json(file.get_line())
#		file.close()
#		dict = aa
#		return aa



#
#func save():
#	var save_game = File.new()
#	save_game.open("user://savegame.save", File.WRITE)
#	var lvl = 1
#	if dict != null:
#		lvl = dict["current_level"]
#	var new_dict =  {
#		"current_level" : lvl ,
#		"Master": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")),
#		"SFX": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")),
#		"BGM": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BGM")),
#	}
#	save_game.store_line(to_json(new_dict))
#	save_game.close()		
#
#func get_level_on_file():
#	var save_game = File.new()
#	if ! save_game.file_exists("user://savegame.save"):
#		return 1
#	save_game.open("user://savegame.save",File.READ)
#	return (parse_json(save_game.get_line())["current_level"])
