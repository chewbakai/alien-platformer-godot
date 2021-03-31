extends Area2D

signal reveal_keys

func _ready():
	visible = true
	pass

func _on_Area2D_body_entered(body):
	if visible && body.get_name() == "Player":
		visible = false
		emit_signal("reveal_keys")
		get_node("AudioStreamPlayer").play()

func _on_AudioStreamPlayer_finished():
	queue_free()
	pass 
