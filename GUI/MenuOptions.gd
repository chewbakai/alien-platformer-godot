extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current 
var options = ["Continue", "NewGame", "Options"]
var choice
var options_length
# Called when the node enters the scene tree for the first time.
func _ready():
	choice = 0 
	current = options[choice]
	options_length = options.size()
	show_arrow(options[choice])

func _input(event):
	if (event.is_action_pressed("ui_down") || event.is_action_pressed("ui_up") || event.is_action_pressed("jump") || event.is_action_pressed("crouch")):
		hide_arrow(options[choice])
		if event.is_action_pressed("ui_down") || event.is_action_pressed("crouch"):			
			if choice >= options_length - 1:
				choice = 0
			else:
				choice += 1
		else:
			if choice == 0:
				choice = options_length - 1
			else:
				choice -= 1	
		current = options[choice]
		show_arrow(options[choice])	
	elif event.is_action_pressed("ui_accept"):
		match options[choice]:
			"NewGame": 
				init_new_game()
			
func init_new_game():
	get_tree().change_scene("res://Levels/Level1.tscn")
	
func hide_arrow(option):
	get_node(option).get_node("Sprite").hide()
	
func show_arrow(option):
	get_node(option).get_node("Sprite").show()
