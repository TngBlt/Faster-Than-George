extends Node2D

export var value = 1


func _ready():
	if get_owner() != null:
		get_owner().NbTotalMilkyWay += value
	get_node("Area2D").connect("body_enter", self, "_collectMilkyWay")



func _collectMilkyWay( body ):
	if body.get_name() == "player" :
		get_owner().NbCollectedMilkyWay += value
		print(get_owner().NbCollectedMilkyWay)
		queue_free()
