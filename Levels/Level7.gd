extends "BaseLevel.gd"

onready var Bat = preload("res://Actors/Bat/Bat.tscn")


func _ready():
	initialize(3,7,960)
	get_node("Potion").connect("reveal_keys",self,"_on_Potion_collect")
	player.connect("die",self,"_on_Player_die")
	make_keys_invisible(true)
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
		player.position.y = 90

func make_keys_invisible(my_bool):
	var node
	for number in range(req_keys):
		node = get_node("Key"+str(number+1))
		print(my_bool)
		node.get_node("CollisionShape2D").set_deferred("disabled", my_bool)
		if my_bool:
			node.hide()
		else:
			node.show()
			
func _on_Potion_collect():
	make_keys_invisible(false)
	

		
