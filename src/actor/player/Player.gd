extends Actor

const JUMP_DURATION_MAX:= 0.2 # In seconds

var jump_duration:= 0.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("player_menu"):
		get_tree().quit()
	
	_direction = Vector2(
		get_direction_x(),
		get_direction_y(delta)
	)


func get_direction_x():
	var direction_x = 0.0
	if Input.is_action_pressed("player_move_left"):
		direction_x = -1.0
	elif Input.is_action_pressed("player_move_right"):
		direction_x = 1.0
	return direction_x


func get_direction_y(
	delta: float
):
	var direction_y = 0.0
	
	if (Input.is_action_just_pressed("player_move_up") 
			and is_on_floor()):
		jump_duration = 0.0
	
	if Input.is_action_pressed("player_move_up"):
		direction_y = -1.0
		jump_duration += delta
		if (jump_duration >= JUMP_DURATION_MAX):
			direction_y = 0
	
	return direction_y
