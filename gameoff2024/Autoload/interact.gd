extends Node

# Hehehe now for the sacriligious shit

## Living Room ##
var fire_place_interactions = 0
var book_shelf_interactions = 0
var couch_1_interactions = 0

## Lounge ##
var sus_plant_interactions = 0

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
