extends TextureButton


func _ready():
	TextureButton.connect("pressed", self, "on_pressed")


func _on_MenuButton_pressed():
	get_tree().change_scene("res://Menu.tscn")
