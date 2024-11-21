extends Node2D

@onready var player = %Player

func _ready():
	match RoomTransitions.prev_room:
		"lounge":
			player.position.x = 724
			player.position.y = 369
