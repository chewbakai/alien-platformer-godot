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
		match options[choice]:
			"NewGame": 
				init_new_game()
#
func init_new_game():
	get_tree().change_scene("res://Levels/Level1.tscn")
	
func toggle_arrow(node,hide):
	var sprite = get_node(node+"/Sprite")
	if hide:	
		sprite.hide()
	else:
		sprite.show()
		
func play_sound(input):
	var asset
	match input:
		"select": 
			asset = "res://Audio/select_menu_085.wav"		
		"enter": 
			asset = "res://Audio/enter_menu_150.wav"
	if asset:
		var sfx = load(asset)
		var aud = get_node("AudioStreamPlayer") 
		aud.stream = sfx
		aud.play()
