extends "BaseLevel.gd"

func _ready():
	initialize(2,5,720)
	get_node("Potion").connect("reveal_keys",self,"_on_Potion_collect")
	make_keys_invisible(true)
	pass

func make_keys_invisible(my_bool):
	var node
	for number in range(req_keys):
		print(number)
		node = get_node("Key"+str(number+1))

		if my_bool:
			node.hide()
		else:
			node.show()


#
func _on_Potion_collect():
	make_keys_invisible(false)
