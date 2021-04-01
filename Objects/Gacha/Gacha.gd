extends Area2D

#signal load_previous_level

func _ready():
	pass
	
func _on_Gacha_body_entered(body):
	randomize()
	var number = randf()
	print(number)
	if body.get_name() == "Player":
		if number <= 0.5:
			get_parent().load_previous_level()
		else:
			get_parent().help_player()
		queue_free()
	pass
