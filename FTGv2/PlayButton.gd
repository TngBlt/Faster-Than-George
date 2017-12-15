extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():	
	TextureButton.connect("pressed", self, "on_pressed")

func on_pressed():
	print("hello")

func _on_PlayButton_pressed():
	get_tree().change_scene("res://background.tscn")