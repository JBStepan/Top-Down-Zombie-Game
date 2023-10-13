extends CharacterBody2D

@export var speed = 200
@export var friction = 0.5
@export var acceleration = 0.1

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
	if Input.is_action_pressed('left'):
		input.x -= 1
	if Input.is_action_pressed('backward'):
		input.y += 1
	if Input.is_action_pressed('forward'):
		input.y -= 1
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
	look_at(get_global_mouse_position())
