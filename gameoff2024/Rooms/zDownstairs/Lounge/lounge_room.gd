extends Node2D

@onready var player = %Player

func _ready():
	match RoomTransitions.prev_room:
		"living_room":
			player.position.x = 328
			player.position.y = 288
		"rons_study":
			player.position.x = 165
			player.position.y = 734
		"bathroom":
			player.position.x = 678
			player.position.y = 618
		"samanthas_study":
			player.position.x = 69
			player.position.y = 625
