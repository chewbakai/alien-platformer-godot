extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#onready var tween = get_node("Tween")
# Called when the node enters the scene tree for the first time.
func _ready():
#	tween.interpolate_property(get_node("Sprite"),"scale",Vector2(1,1),Vector2(0,0),0.2,tween.TRANS_LINEAR,tween.EASE_IN)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	
	pass # Replace with function body.


func _on_Key_body_entered(body):
	if body.get_name() == "Player":
		print("hety")
		body.collect_key()
		queue_free()
#		var owners = get_shape_owners()
#		shape_owner_clear_shapes(owners[0])
#		tween.start()


