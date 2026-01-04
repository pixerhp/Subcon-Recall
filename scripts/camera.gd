extends Camera2D

var move_normalized: Vector2 = Vector2()
func _process(_delta):
	move_normalized = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	move_normalized = move_normalized.normalized()
	
	self.position += move_normalized
