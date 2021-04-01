extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_contact_monitor(true)
	contacts_reported = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RigidBody2D_body_entered(body):
	print("here")
	
	if body.get_name() == "Player":
		body.shake_camera()
	pass # Replace with function body.
