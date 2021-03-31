extends Node2D

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		get_node("Mob").active()

func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		get_node("Mob/Timer").start()

