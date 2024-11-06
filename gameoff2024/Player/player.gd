extends CharacterBody2D

@export var mp: MovementPack

func move():
	pass

func get_input():
	var x_axis = 0
	
	if Input.is_action_pressed("left"):
		x_axis = -1 
	elif Input.is_action_pressed("right"):
		x_axis = 1 
	
	return x_axis
