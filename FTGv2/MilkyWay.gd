extends Node2D

export var value = 1


func _ready():
	if get_owner() != null:
d		get_owner().NbTotalMilkyWay += value
	get_node("Area2D").connect("body_enter", self, "_collectMilkyWay")



func _collectMilkyWay( body ):
	get_owner().NbCollectedMilkyWay += value
	print(get_owner().NbCollectedMilkyWay)
	queue_free()
