extends Area2D

func _ready():
	pass

func _on_Spike_body_entered(body):
	print("hey")
	if body.get_name() == "Player":
		body.die()
