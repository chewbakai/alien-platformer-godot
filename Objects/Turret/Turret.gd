extends StaticBody2D
var Bullet = preload("res://Objects/Turret/Bullet.tscn")
var bullet
onready var audio = get_node("AudioStreamPlayer2D")
export var wait_time = 1.0
func _ready():
	get_node("Timer").set_wait_time(wait_time)
	pass

func _on_Timer_timeout():
	bullet = Bullet.instance()
	add_child(bullet)
	audio.play()
	pass



	pass # Replace with function body.
