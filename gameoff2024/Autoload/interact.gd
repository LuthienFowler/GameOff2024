extends Node

signal interacted(interactable_name)

func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signal)

func interact(timeline_name: String):
	Dialogic.start(timeline_name)

func dialogic_signal(arg: String):
	if arg == "start":
		Global.current_game_state = Global.game_states.DIALOGUE
	elif arg == "end":
		Global.current_game_state = Global.game_states.PLAY
