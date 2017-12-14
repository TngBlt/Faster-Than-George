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
