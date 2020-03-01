extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var stat = get_node("/root/Tracker")

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		stat.nextWorld()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
