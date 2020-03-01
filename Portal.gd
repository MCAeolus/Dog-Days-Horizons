extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var anim = $AnimationPlayer
onready var camera = self.get_tree().current_scene.get_node("Camera2D")
var opened = false

onready var tracker = get_node("/root/Tracker")


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("closed")
	pass # Replace with function body.


func open():
	opened = true
	anim.play("open")
	#camera.setTarget(self)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_body_entered(body):
	if opened:
		tracker.nextWorld()
		print("done")
