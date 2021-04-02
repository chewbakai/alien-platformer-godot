extends "BaseLevel.gd"

onready var Bat = preload("res://Actors/Bat/Bat.tscn")


func _ready():
	initialize(3,7,960)
	player.connect("die",self,"_on_Player_die_")
	pass # Replace with function body.


func _on_Player_die():
	get_node("Timer").stop()
	fail()

func _on_Timer_timeout():
	var bat = Bat.instance()
	add_child(bat)
	pass # Replace with function body.

func load_previous_level():
	get_tree().change_scene("res://Levels/Level"+str(get_level_number()-1)+".tscn")			

func _on_Gacha_enter(result):
	if result <= 0.5:
		load_previous_level()
	else:
		player.position.x = 807
		player.position.y = 88
		
