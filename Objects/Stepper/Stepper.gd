extends Node2D

export var idle_duration = 1.5

export var move_to = Vector2.RIGHT * 100
export var speed = 1.5
onready var platform = get_node("KinematicBody2D")
onready var tween = get_node("Tween")
var duration
var follow = Vector2.ZERO

func _ready():
	print(position)
	start_tween()
	pass 
	
func start_tween():
	duration = 1
	duration = move_to.length() / float(speed * 16)
	tween.interpolate_property(self,"follow",follow,move_to,duration,tween.TRANS_QUINT,tween.EASE_IN,idle_duration)
	tween.interpolate_property(self,"follow",move_to,follow,duration,tween.TRANS_QUINT,tween.EASE_IN,duration + idle_duration)
	tween.start()
	
func _physics_process(delta):
	platform.position = platform.position.linear_interpolate(follow,0.075)

# https://www.youtube.com/watch?v=mBNa8LcAsns <- this guy's code
