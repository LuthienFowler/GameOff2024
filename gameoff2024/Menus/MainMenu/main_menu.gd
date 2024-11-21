extends CanvasLayer

func _on_play_pressed() -> void:
	RoomTransitions.change_room("res://Rooms/zDownstairs/Living Room/livingRoom.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
