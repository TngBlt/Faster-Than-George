extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	
func _process(delta):
	var pos = get_pos()
	set_pos(Vector2(pos.x + 2, pos.y))
