extends Node2D

@onready var player = %Player

func _ready():
	match RoomTransitions.prev_room:
		"lounge":
			player.position.x = 724
			player.position.y = 369
			
		"dining_room":
			player.position.x = 762
			player.position.y = 249
