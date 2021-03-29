extends KinematicBody2D

const FLOOR = Vector2(0,-1)
const GRAVITY = 10

var jump_power = -16*16
var walk_speed = 16*15
var velocity = Vector2.ZERO
var jumping = false
var _name = "Player"
var keys = 0
var dead = false

func _ready():
	pass

func _physics_process(_delta):
	velocity.x = 0 ## Friction??
	
	var walk_east = Input.is_action_pressed("walk_east")
	var walk_west = Input.is_action_pressed("walk_west")
	var jump = Input.is_action_just_pressed("jump")
		
	if walk_west:
		play_animation("walk_west")
		change_velocity('x',-walk_speed)
	if walk_east:
		play_animation("walk_east")
		change_velocity('x',walk_speed)

	if !walk_east && !walk_west:
		play_animation("idle")
	if jump && is_on_floor():
		jumping = true
		play_animation("jump")
		change_velocity('y',jump_power)
		
	change_velocity('y',GRAVITY) ## Apply gravity
	
	velocity = move_and_slide(velocity,FLOOR)

	pass

func change_velocity(axis,change):
	if axis == 'x':
		velocity.x += change
	elif axis == 'y':
		velocity.y += change	
		if jumping && is_on_floor():
			jumping = false

	
func play_animation(movement):
	var anim_sprite = get_node("AnimatedSprite")
	if movement == "walk_west":
		anim_sprite.flip_h = true
		anim_sprite.play("walk")		
	elif movement == "walk_east":
		anim_sprite.flip_h = false
		anim_sprite.play("walk")
	elif movement == "idle":
		anim_sprite.play("idle")
	if movement == "jump":
		anim_sprite.play("jump")
		play_sound("jump")

func get_name():
	return _name

func die():
	dead = true
	play_sound("die")
	
func collect_key():
	keys += 1

	
func get_keys():
	return keys

func set_camera_limits(tile_map):
	$Camera2D.limit_right = (tile_map.get_used_rect().end.x * 16) - 16

func set_position(pos):
	position.x = pos.x
	position.y = pos.y


func _on_AudioStreamPlayer_finished():
	if dead == true:
		queue_free()
		pass # Replace with function body.

func play_sound(input):
	var asset
	match input:
		"jump": asset = "res://Audio/jump_jekkech.wav"
		"die": asset = "res://Audio/hurt_explosion_02.wav"
	if asset:
		var sfx = load(asset)
		var aud = get_node("AudioStreamPlayer") 
		aud.stream = sfx
		if input == "jump":
			aud.set_volume_db(-10)
		aud.play()
