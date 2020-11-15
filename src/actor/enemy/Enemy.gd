extends Actor

var _direction_x = -1.0


func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	var stomp_detector:= get_node("StompDetector") as Area2D
	if body.global_position.y > stomp_detector.global_position.y:
		return
	queue_free()


func _physics_process(_delta: float) -> void:
	_direction = Vector2(
		get_direction_x(),
		0
	)

func get_direction_x() -> float:
	if is_on_wall():
		_direction_x*= -1.0
	return _direction_x
