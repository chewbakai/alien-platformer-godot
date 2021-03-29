extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var audio = get_node("AudioStreamPlayer")
	if(Pause.bgm_helper != 0):
		audio.seek(Pause.bgm_helper)
	else:
		audio.seek(0)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
