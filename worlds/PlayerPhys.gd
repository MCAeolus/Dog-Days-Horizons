extends KinematicBody2D

const GRAV = Vector2(0, 1) * 50
const JUMP_FORCE = Vector2(0, -1) * 750
const MOVE_SPEED = Vector2(-1, 0) * 120
const MOVE_MAX = 950


var MOVEMENT = Vector2(0, 0)
var jump_count = 0
var moving = false

onready var camera = self.get_tree().current_scene.get_node("Camera2D")
onready var anim = $AnimationPlayer
onready var sprite = $Sprite
	
	
func _process(delta):
	#if moving:
	camera.setTarget(self)
	
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func _physics_process(delta):
	
	
	moving = false
	if Input.is_action_pressed("move_left"):
		flip(true)
		MOVEMENT -= MOVE_SPEED
		moving = true
	if Input.is_action_pressed("move_right"):
		flip(false)
		MOVEMENT += MOVE_SPEED
		moving = true
		

	if not moving:
		animate("still")
		MOVEMENT = Vector2(0, MOVEMENT.y)
	else:
		animate("run")
	
	if not is_on_floor():
		animate("jump")
		MOVEMENT += GRAV	
	else:
		jump_count = 0
		MOVEMENT = Vector2(MOVEMENT.x, 0)
			
		
	
	
	if abs(MOVEMENT.x) > MOVE_MAX:
		MOVEMENT = Vector2(MOVE_MAX * sign(MOVEMENT.x), MOVEMENT.y)	
			

	if Input.is_action_just_pressed("jump") and jump_count < 2:
		jump_count += 1
		MOVEMENT = Vector2(MOVEMENT.x, 0)
		MOVEMENT += JUMP_FORCE
		
	move_and_slide(MOVEMENT, Vector2(0, -1))
	
	
func flip(left):
	sprite.flip_h = left
	
func animate(name):
	if anim.is_playing() and anim.current_animation == name:
		return
	anim.play(name)
