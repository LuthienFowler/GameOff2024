extends Area2D

@export var next_room: PackedScene

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerTransitionArea"):
		RoomTransitionHandler.transition_rooms(next_room.resource_path)
		print("Player is here and this is working")
