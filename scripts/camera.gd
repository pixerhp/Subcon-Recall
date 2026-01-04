extends Camera2D

var move_normalized: Vector2 = Vector2()
func _process(_delta):
	move_normalized = Input.get_vector("left", "right", "up", "down")
	move_normalized = move_normalized.normalized()
	
	self.position += move_normalized
