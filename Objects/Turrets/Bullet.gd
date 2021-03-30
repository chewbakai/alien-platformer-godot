extends Area2D

var collision

func _ready():
	position.x = 5
	position.y = 3
	pass

func _physics_process(delta):
	position.x += 200 * delta

func _on_Area2D_body_entered(body):
	queue_free()
#	if body.get_name() == "Player":
#		body.die()
#		queue_free()
#	else:
#		queue_free()



	pass # Replace with function body.
