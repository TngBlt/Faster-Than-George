<<<<<<< HEAD
extends KinematicBody2D
 
var input_direction = 0
var direction = 1
 
var speed = Vector2()
var velocity = Vector2()
 
const MAX_SPEED = 600
const ACCELERATION = 1200
const DECELERATION = 2000
 
const JUMP_FORCE = 700
const GRAVITY = 2000
 
 
func _ready():
	set_process(true)
	set_process_input(true)
 
 
func _input(event):
	if event.is_action_pressed("jump"):
		speed.y = -JUMP_FORCE
 
 
func _process(delta):
	if input_direction:
		direction = input_direction
   
	if Input.is_action_pressed("move_left"):
		input_direction = -1
	elif Input.is_action_pressed("move_right"):
		input_direction = 1
	else:
		input_direction = 0
   
	if input_direction == - direction:
		speed.x /= 3
	if input_direction:
		speed.x += ACCELERATION * delta
	else:
		speed.x -= DECELERATION * delta
	speed.x = clamp(speed.x, 0, MAX_SPEED)
   
	speed.y += GRAVITY * delta
   
	velocity = Vector2(speed.x * delta * direction, speed.y * delta)
	var movement_remainder = move(velocity)
   
	if is_colliding():
		var normal = get_collision_normal()
		var final_movement = normal.slide(movement_remainder)
		speed = normal.slide(speed)
		move(final_movement)
=======
extends RigidBody2D

var btn_right = Input.is_action_pressed("ui_right")
var btn_left = Input.is_action_pressed("ui_left")
export var speed = 200
export var acceleration = 5
var current_speed = Vector2(0,0)

func move(speed, acc, delta):
	current_speed.x =lerp(current_speed.x, speed, acc*delta)
	set_linear_velocity(Vector2(current_speed.x,get_linear_velocity().y))

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	btn_right = Input.is_action_pressed("ui_right")
	btn_left = Input.is_action_pressed("ui_left")
	
	if btn_left:
		move(-speed, acceleration,delta)
	elif btn_right:
		move(speed, acceleration,delta)
	else:
		move(0, acceleration,delta)
>>>>>>> ee2452b7f368fbc7f0fcc89103c093644840b0df
