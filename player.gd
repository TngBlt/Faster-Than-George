extends KinematicBody2D

var input_direction = 0
var direction = 0

var speed_x = 0
var speed_y = 0
var velocity = Vector2()
const MAX_SPEED = 600
const ACCELERATION = 600
const DECELERATION = 600


<<<<<<< HEAD
const JUMP_FORCE = 800
const GRAVITY = 2000

=======
>>>>>>> 36198e1bc95ee04230f89343148e4e0742fbaad6
func _ready():
	set_process(true)
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("jump"):
		speed_y = -JUMP_FORCE
	pass

func _process(delta):
	if (is_colliding()):
		print("COLLIDING WITH", get_collider())
		
	 # INPUT
	if input_direction:
		direction = input_direction
   
	if Input.is_action_pressed("move_left"):
		input_direction = -1
	elif Input.is_action_pressed("move_right"):
		input_direction = 1
	else:
		input_direction = 0
	
	# MOVEMENT
	if input_direction == - direction:
		speed_x /= 3
	if input_direction:
		speed_x += ACCELERATION * delta
	else:
		speed_x -= DECELERATION * delta
	speed_x = clamp(speed_x, 0, MAX_SPEED)
	
	speed_y += GRAVITY * delta
		
	velocity.x = speed_x * delta * direction
	velocity.y = speed_y * delta
	move(velocity) 
	
	
	
	
	
	
	
	
	