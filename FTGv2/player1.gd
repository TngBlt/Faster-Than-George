extends KinematicBody2D

# Laws of Physics
const GRAVITY = 2000

# Movement Constants
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 20
const MOVEMENT_SPEED = 400
const ACCELERATION = 0.8
const ACCELERATIONN = 1200
const DECELERATION = 2000
const JUMP_FORCE = 1600
const JUMP_TIME_THRESHOLD = 0.2 # seconds
const MAX_SPEED = 600

# Player Variables
var velocity = Vector2()
var can_jump = false
var jump_timer = 0
var direction = 0
	# Movement
var movement = 0
export var health = 1

# Start
func _ready():
	set_fixed_process(true)

# Processing
func _fixed_process(delta):
	
	if movement:
		direction = movement
	
	
	# Increment time
	jump_timer += delta
	
	# Old:
	# move(velocity)
	
	# New:
	# Move and Slide
	velocity = move_and_slide(velocity, FLOOR_NORMAL, SLOPE_FRICTION)
	
	# Jump Timer Controller
	if(is_move_and_slide_on_floor()):
		jump_timer = 0
	
	# Can jump?
	can_jump = jump_timer < JUMP_TIME_THRESHOLD
	
	# Input: LEFT
	if(Input.is_action_pressed("ui_left")):
		movement = -1
	
	# Input: RIGHT
	elif(Input.is_action_pressed("ui_right")):
		movement = 1
	else:
		movement = 0
	
	if movement == - direction:
		velocity.x /= 3
	if movement:
		velocity.x += ACCELERATIONN * delta
	else:
		velocity.x -= DECELERATION * delta
	velocity.x = clamp(velocity.x, 0, MAX_SPEED)
# Add Gravity
	velocity.y += GRAVITY * delta
   

	# Set movement speed
	movement *= MOVEMENT_SPEED
	
	# Change horizontal velocity
	velocity.x = lerp(velocity.x, movement, ACCELERATION)
	
	# Input: Jump
	if(can_jump && Input.is_action_pressed("jump")):
		velocity.y -= JUMP_FORCE
		jump_timer = JUMP_TIME_THRESHOLD
	if(is_colliding()):
		if(get_collider().is_in_group("obstacle")):
			print(get_collider())
			health -= 1
	if(health < 1):
		get_tree().change_scene("res://gameOver.tscn")
		
