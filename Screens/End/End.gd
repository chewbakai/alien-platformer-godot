extends Node2D


var Dialog = preload("res://GUI/Dialog.tscn")
var dialog

func _ready():
	dialog = Dialog.instance()
	dialog.set_message("Alien: It seems like this is the end of this boring place. I sure hope someone will come for me.")
	add_child(dialog)
	$AnimationPlayer.play("end")
	pass 


func _physics_process(_delta):
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://GUI/MainMenu.tscn")
	pass # Replace with function body.
