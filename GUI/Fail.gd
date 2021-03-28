extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var previous_level
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_tree().current_scene.name)
#	get_node("Timer").connect("timeout", self, "_on_Fail_timeout")
	pass # Replace with function body.

#func _on_Fail_timeout():
#	queue_free()
#	get_tree().change_scene("res://Levels/Level"+previous_level+".tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
