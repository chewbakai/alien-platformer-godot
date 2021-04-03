extends CanvasLayer

var current_level

func _ready():
	get_node("Timer").connect("timeout", self, "_on_Fail_timeout")
	get_node("Die").play()
	
func _on_Fail_timeout():
	change_scene()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		change_scene()
		
func change_scene():
	get_tree().change_scene("res://Levels/Level"+str(current_level)+".tscn")
	
