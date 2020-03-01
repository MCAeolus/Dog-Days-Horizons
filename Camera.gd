extends Camera2D

const speed = 0.001
const min_dist = 0.05
const min_y =  640/2
const min_x =  1024/2

var target = null
var targetPos = null
var originalPosition = null

var prop = 0.0



func setTarget(target):
	prop = 0.0
	self.originalPosition = self.position
	self.target = target
	limitPos()
	
	set_process(true)

func limitPos():
	
	targetPos = target.position
	
	var y = targetPos.y
	var x = targetPos.x
	
	if y > min_y:
		y = min_y
	if x < min_x:
		x = min_x
	targetPos = Vector2(x, min_y)


func _process(delta):
	if target != null:
		prop += speed
		#limitPos()
		self.position = targetPos.linear_interpolate(originalPosition, prop)

		if abs(self.position.distance_to(targetPos)) <= min_dist:
			self.position = targetPos
			self.target = null
			set_process(false)

# Called when the node enters the scene tree for the first time.
func _ready():
	originalPosition = get_camera_screen_center()
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
