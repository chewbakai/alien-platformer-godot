extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#onready var tween = get_node("Tween")
# Called when the node enters the scene tree for the first time.
func _ready():
#	tween.interpolate_property(get_node("Sprite"),"position",Vector2(0,0),Vector2(0,5),0.5,tween.TRANS_LINEAR,tween.EASE_IN)
#	tween.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Key_body_entered(body):
	if body.get_name() == "Player":
		body.collect_key()
		get_node("AudioStreamPlayer").play()

func _on_AudioStreamPlayer_finished():
	queue_free()
	pass # Replace with function body.


#func _on_Tween_tween_completed(object, key):
#	tween.invert()
#	pass # Replace with function body.
