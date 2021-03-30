extends "BaseLevel.gd"

func _ready():
	initialize(1,1)
	get_node("Player/Camera2D").limit_right = 672
