extends Node2D

const TOTAL_LEVELS = 5

var req_keys = 0
var Fail = preload("res://Levels/Extras/Fail.tscn")
var Intro = preload("res://Levels/Extras/Intro.tscn")
onready var player = get_node("Player")
var level_number

func _ready():
	pass
	
func initialize(n_keys,lvl_number):
	set_req_keys(n_keys)
	set_level_number(lvl_number)
#	player.set_camera_limits(get_node("TileStands"))
	get_node("Door/Area2D").connect("body_entered",self,"_on_Door_entered")
	get_node("Fall").connect("body_entered",self,"_on_Body_fall")
	var intro = Intro.instance()
	intro.set_level(lvl_number)
	add_child(intro)
	resume_audio()
	
func set_req_keys(n_keys):
	req_keys = n_keys
	
func get_req_keys():
	return req_keys
	
func set_level_number(lvl):
	level_number = lvl

func get_level_number():
	return level_number 

func fail(player):
	player.die()
	get_node("AudioStreamPlayer").stop()
	var fail = Fail.instance()
	fail.current_level = get_level_number()
	add_child(fail)
	
	
func _on_Body_fall(body):
	if body.get_name() == "Player":
		fail(body)

func _on_Door_entered(body):
	if body.get_name() != "Player":
		return
	if body.get_keys() < req_keys:
		dialog("I still lack keys")
	else:
		Pause.bgm_helper = get_node("AudioStreamPlayer").get_playback_position()
		if level_number != TOTAL_LEVELS:
			get_tree().change_scene("res://Levels/Level"+str(get_level_number()+1)+".tscn")			
		else:
			play_credits()

func play_credits():
	print("TODO")

func dialog(string):
	print(string)

func restart_level():
	get_tree().change_scene("res://Levels/"+str(get_level_number())+".tscn")

func resume_audio():
	var audio = get_node("AudioStreamPlayer")
	if(Pause.bgm_helper != 0):
		audio.seek(Pause.bgm_helper)
	else:
		audio.seek(0)

