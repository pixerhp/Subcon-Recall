extends CharacterBody2D

var worldcam_node_ref: Camera2D

func _ready():
	worldcam_node_ref = %WorldCam

var subpix_position: Vector2i = Vector2i(0, 0)
var subpix_velocity: Vector2i = Vector2i(0, 0)

var max_walk_speed: int = 40
var max_move_speed_this_frame: int = max_walk_speed
func _process(_delta):
	handle_inputs()
	
	if not (Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")):
		if subpix_velocity.x > 0:
			subpix_velocity.x -= 13
			subpix_velocity.x = max(subpix_velocity.x, 0)
		elif subpix_velocity.x < 0:
			subpix_velocity.x += 13
			subpix_velocity.x = min(0, subpix_velocity.x)
	
	subpix_position += subpix_velocity
	
	self.position = subpix_position / 16
	worldcam_node_ref.position = self.position

func handle_inputs():
	if Input.is_action_pressed("action"): max_move_speed_this_frame = max_walk_speed * 2
	else: max_move_speed_this_frame = max_walk_speed
	
	if Input.is_action_pressed("move_left"):
		subpix_velocity.x -= 13
		subpix_velocity.x = max(-max_move_speed_this_frame, subpix_velocity.x)
	if Input.is_action_pressed("move_right"):
		subpix_velocity.x += 13
		subpix_velocity.x = min(subpix_velocity.x, max_move_speed_this_frame)
	if Input.is_action_pressed("move_down"):
		subpix_position.y += max_move_speed_this_frame
	if Input.is_action_pressed("move_up"):
		subpix_position.y -= max_move_speed_this_frame
	if Input.is_action_just_pressed("jump"):
		pass
	if Input.is_action_just_pressed("action"):
		pass
	if Input.is_action_just_pressed("start"):
		pass
	if Input.is_action_just_pressed("select"):
		pass
