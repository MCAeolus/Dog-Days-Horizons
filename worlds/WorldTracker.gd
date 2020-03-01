extends Node2D

var points_taken = 0


onready var portal = get_node("Portal")

func pointCollected():
	points_taken += 1
	if points_taken >= 3:
		portal.open()

func _ready():
	pass # Replace with function body.
