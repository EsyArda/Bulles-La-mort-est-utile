extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_Bulle(pos):
	var bulle = load("bulle_Plateforme.tscn").instance()
	add_child(bulle)
	bulle.position = pos
	print(bulle.position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
