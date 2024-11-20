extends Node

func transition_rooms(next_room_path):
	TransitionAnims.play_anim("fade_in")
	get_tree().change_scene_to_file(next_room_path)
	TransitionAnims.play_anim("fade_out")
