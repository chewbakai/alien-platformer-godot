extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const REQ_KEYS = 1

var Player = preload("res://Actors/Player/Player.tscn")
var Door = preload("res://Objects/Door/Door.tscn")
var Fail = preload("res://GUI/Fail.tscn")
#var Key = preload("res://Objects/Key/Key.tscn")
var player
var door 

func _ready():
	create_player()
	create_door()
	$AudioStreamPlayer.play()
#	place_keys()

func create_player():
	player = Player.instance()
	player.set_position({"x":13,"y":174})
	player.set_camera_limits(get_node("TileStands"))
	add_child(player)

func create_door():
	door = Door.instance()
	door.position.x = 665
	door.position.y = 168
	door.get_node("Area2D").connect("body_entered", self, "_on_Door_entered")
	add_child(door)
	
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

#func place_keys():
#	var key = Key.instance()
#	key.position.x = 158
#	key.position.y = 202	
#	add_child(key)

