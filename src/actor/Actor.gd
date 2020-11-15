extends KinematicBody2D
class_name Actor

export var speed = 1000.0

# Actor mass between 0 and 1, 0 experience no gravity and 1 full gravity.
const mass = 1.0

# Gravity acceleration in pixels/sec/sec.
const GRAVITY:= Vector2(0, 4000)
# Velocity in pixels/sec or pixels/frame.
var velocity = Vector2.ZERO


var _direction:= Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY.y * mass * delta # Acceleration must include delta
	velocity.x = _direction.x * speed
	velocity = move_and_slide(velocity) # Includes delta
