extends VideoPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_stream()
	# class member variables go here, for example:

func _on_Music_finished():
	get_tree().change_scene("res://Menu.tscn")


func _on_input_event(ev):
	if ev.type == InputEvent.MOUSE_BUTTON :
		get_tree().change_scene("res://Menu.tscn")
