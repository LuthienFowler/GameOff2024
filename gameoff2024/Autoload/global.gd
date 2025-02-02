extends Node

enum game_states {GAME_MENU, PLAY, DIALOGUE}

var current_game_state = game_states.PLAY

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug") and current_game_state == game_states.PLAY:
		current_game_state = game_states.DIALOGUE
	elif Input.is_action_just_pressed("debug") and current_game_state == game_states.DIALOGUE:
		current_game_state = game_states.PLAY
	
