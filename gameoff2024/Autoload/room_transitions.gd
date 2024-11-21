extends Node

func change_room(room_path):
	call_deferred("get_room", room_path)

func get_room(room_path):
	get_tree().change_scene_to_file(room_path)
