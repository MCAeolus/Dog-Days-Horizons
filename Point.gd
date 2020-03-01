extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tracker = self.get_tree().get_root().get_node("World")
onready var anim = $AnimationPlayer
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _ready():
	anim.play("default")

func _on_Point_body_entered(body):
	queue_free()
	tracker.pointCollected()
