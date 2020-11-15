extends KinematicBody2D
class_name Actor

export var speed:= Vector2(1000, 200)

# Actor mass between 0 and 1, 0 experience no gravity and 1 full gravity.
const mass:= float(1.0)

# Gravity acceleration in pixels/sec/sec.
const GRAVITY:= Vector2(0, 4000)
# Velocity in pixels/sec or pixels/frame.
var _velocity = Vector2.ZERO


var _direction:= Vector2.ZERO

func _physics_process(delta: float) -> void:
	_velocity.x = get_velocity_x(
		_direction.x
	)
	_velocity.y = get_velocity_y(
		_velocity.y,
		_direction.y,
		delta
	)
	_velocity = move_and_slide(
		_velocity,
		Vector2.UP
	) # Move and slide automatically includes delta

func get_velocity_x(
	direction_x: float
) -> float:
	return direction_x * speed.x

func get_velocity_y(
	current_velocity_y: float,
	direction_y: float,
	delta: float
) -> float:
	var velocity_y = current_velocity_y
	# Gravity
	velocity_y += GRAVITY.y * mass * delta # Acceleration must include delta
	# Actor
	velocity_y += direction_y * speed.y
	
	return velocity_y
