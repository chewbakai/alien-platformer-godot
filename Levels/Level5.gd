extends "BaseLevel.gd"

func _ready():
	initialize(2,5,720)
	get_node("Potion").connect("reveal_keys",self,"_on_Potion_collect")
	player.get_node("Camera2D").limit_right = 830
	make_keys_invisible(true)
	pass

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
	
