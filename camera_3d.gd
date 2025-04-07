extends Camera3D
var camera_rotation = Vector3.ZERO
@export var horizontal_rotate_speed = 0.05
@export var vertical_rotate_speed = 0.05
@export var translate_speed = 0.5


func _physics_process(delta):

	var directionForward = transform.basis.z
	var directionStrafe = transform.basis.x

	if Input.is_action_pressed("ui_forward"):
		self.position -= directionForward * translate_speed
	if Input.is_action_pressed("ui_back"):
		self.position += directionForward * translate_speed
	if Input.is_action_pressed("ui_strafe_right"):
		self.position += directionStrafe * translate_speed
	if Input.is_action_pressed("ui_strafe_left"):
		self.position -= directionStrafe * translate_speed
		
	if Input.is_action_pressed("ui_right"):
		camera_rotation.y -= horizontal_rotate_speed
	if Input.is_action_pressed("ui_left"):
		camera_rotation.y += horizontal_rotate_speed

	if Input.is_action_pressed("ui_up"):
		camera_rotation.x -= vertical_rotate_speed
	if Input.is_action_pressed("ui_down"):
		camera_rotation.x += vertical_rotate_speed


	self.rotation = camera_rotation
