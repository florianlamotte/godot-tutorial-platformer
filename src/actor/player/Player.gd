extends Actor


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("player_menu"):
		get_tree().quit()
	
	var directionX = 0.0
	if Input.is_action_pressed("player_move_left"):
		directionX = -1.0
	elif Input.is_action_pressed("player_move_right"):
		directionX = 1.0
	
	_direction = Vector2(
		directionX,
		0.0
	)
	
