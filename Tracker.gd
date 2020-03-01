extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var world1 = load("res://worlds/World1.tscn")
var world2 = load("res://World2.tscn")
var world3 = load("res://World3.tscn")
var world4 = load("res://World4.tscn")

var current_world = 1

var points_collected = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func nextWorld():
	current_world += 1
	if current_world > 4:
		current_world = 0
	match current_world:
		1:
			get_tree().change_scene_to(world1)
		2:
			get_tree().change_scene_to(world2)
		3:
			get_tree().change_scene_to(world3)
		4:
			get_tree().change_scene_to(world4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
