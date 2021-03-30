extends Area2D

var collision

func _ready():
	position.x = 10
	pass

func _physics_process(delta):
	position.x += 100 * delta

func _on_Bullet_body_entered(body):
	if body.get_name() == "Player":
		body.die()
		queue_free()
	else:
		queue_free()
