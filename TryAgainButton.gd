extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	TextureButton.connect("pressed", self, "on_pressed")



func _on_TryAgainButton_pressed():
	print("hello !")
	get_tree().change_scene("res://main_background.tscn")
