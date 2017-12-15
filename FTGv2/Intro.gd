extends VideoPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_stream()
	# class member variables go here, for example:

func _on_Music_finished():
	get_tree().change_scene("res://Menu.tscn")
