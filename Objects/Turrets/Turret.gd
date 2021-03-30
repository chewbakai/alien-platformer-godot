extends StaticBody2D
var Bullet = preload("res://Objects/Turrets/Bullet.tscn")
var bullet
func _ready():
	pass

func _on_Timer_timeout():
	bullet = Bullet.instance()
	add_child(bullet)
	pass
