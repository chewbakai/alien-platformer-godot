extends VBoxContainer

var past 
var options = ["Continue", "NewGame", "Options"]
var choice

func _ready():
	choice = 0
	past = 0
	toggle_arrow(options[past],false)

func _input(event):
	if event.is_action_pressed("ui_down") || event.is_action_pressed("crouch"):
		play_sound("select")
		if choice < options.size() -1 :
			choice += 1
		else:
			choice = 0	
		toggle_arrow(options[past],true)
		past = choice
		toggle_arrow(options[choice],false)

	elif event.is_action_pressed("ui_accept"):
		play_sound("enter")
		var lvl
		match options[choice]:
			"Continue":
				lvl = load_file()
			"NewGame": 
				lvl = 1
		init_game(lvl)
		
func init_game(lvl):
	get_tree().change_scene("res://Levels/Level"+str(lvl)+".tscn")
	
func toggle_arrow(node,hide):
	var sprite = get_node(node+"/Sprite")
	if hide:	
		sprite.hide()
	else:
		sprite.show()
		
func play_sound(input):
	var aud = get_node("AudioStreamPlayer") 
	var asset
	match input:
		"select":
			asset = "res://Audio/select_menu_085.wav"	
			aud.set_pitch_scale(1)
		"enter":
			asset = "res://Audio/enter_menu_150.wav"
			aud.set_pitch_scale(0.8)
	var sfx = load(asset)
	aud.stream = sfx
	aud.play()

func load_file():
	var save_game = File.new()
	if ! save_game.file_exists("user://savegame.save"):
		return 1
	save_game.open("user://savegame.save",File.READ)
	return (parse_json(save_game.get_line())["current_level"])
	
