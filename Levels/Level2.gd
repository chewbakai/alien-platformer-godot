extends "BaseLevel.gd"

func _ready():
	initialize(1,2)

func _on_Spike_body_entered(body):
	if body.get_name() == "Player":
		fail(body)
