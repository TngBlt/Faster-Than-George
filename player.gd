extends KinematicBody2D

var input_direction = 0
var direction = 1

var speed = 0
const MAX_SPEED = 600
const ACCELERATION = 1000
const DECELERATION = 2000
var velocity = 0

func _ready():
	set_process(true)
	set_process_input(true)
	pass
	
func _input(event):
	var move_left = event.is_action_pressed("move_left")
	var move_right = event.is_action_pressed("move_right")
	var stop_moving = not Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right")
	
	if move_left:
		input_direction = -1
	elif move_right:
		input_direction = 1
	elif stop_moving:
		input_direction = 0
	
	if move_left or move_right and input_direction:
		if input_direction == - direction:
			speed /= 3
			direction = input_direction 

	pass


func _process(delta):
	
	#MOVEMENT
	
	if input_direction:
		speed += ACCELERATION * delta
	else:
		speed -= DECELERATION * delta	
	speed = clamp(speed, 0, MAX_SPEED)
		
	velocity = speed * delta * direction
	move(Vector2(velocity, 0))
	pass 