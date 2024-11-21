extends Node

func change_room(room_path):
	TransitionAnims.play_anim("fade_in")
	call_deferred("get_room", room_path)
	TransitionAnims.play_anim("fade_out")

func get_room(room_path):
	get_tree().change_scene_to_file(room_path)
