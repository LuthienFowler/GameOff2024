extends Area2D

@export var next_room_path: String 
@export var current_room: String

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerTransitionArea"):
		RoomTransitions.prev_room = current_room
		RoomTransitions.change_room(next_room_path)
