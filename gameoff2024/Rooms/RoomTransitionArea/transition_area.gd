extends Area2D

@export var next_room_path: String 

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerTransitionArea"):
		RoomTransitions.change_room(next_room_path)
