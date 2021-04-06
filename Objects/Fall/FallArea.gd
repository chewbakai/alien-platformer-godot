extends Area2D

func _ready():
	pass

func _on_Fall_body_entered(body):
	if body.get_name() == "Player":
		body.die()
	pass
