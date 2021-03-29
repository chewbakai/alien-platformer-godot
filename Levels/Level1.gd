extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const REQ_KEYS = 1

#var Player = preload("res://Actors/Player/Player.tscn")
var Fail = preload("res://GUI/Fail.tscn")
onready var player = get_node("Player")
#var Key = preload("res://Objects/Key/Key.tscn")

func _ready():
	player.set_camera_limits(get_node("TileStands"))
	get_node("Door/Area2D").connect("body_entered",self,"_on_Door_entered")

func _on_Door_entered(body):
	if body.get_name() == "Player":
		if body.get_keys() >= REQ_KEYS:
			get_tree().change_scene("res://Levels/Level2.tscn")
		else:
			dialog("I still lack keys")

func dialog(string):
	print(string)

func _on_player_fall(body):
	if body.get_name() == "Player":
		$AudioStreamPlayer.stop()
		player.die()
		var fail = Fail.instance()
		fail.previous_level = "1"
		fail.get_node("Timer").connect("timeout", self, "_on_Fail_timeout")
		add_child(fail)
		
func _on_Fail_timeout():
	restart_level()

func restart_level():
	get_tree().change_scene("res://Levels/Level1.tscn")

