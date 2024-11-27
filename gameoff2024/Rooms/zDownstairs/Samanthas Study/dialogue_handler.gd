extends Node

func _ready() -> void:
	Interact.interacted.connect(interact)

func interact(interactable_name) -> void:
	match interactable_name:
		"tripod":
			run_tripod_dialogue()
		"green_screen":
			run_green_screen_dialogue()
		"samantha_couch":
			run_couch_dialogue()

func run_tripod_dialogue() -> void:
	if Interact.tripod_interactions == 0:
		Interact.interact("tripod_1")
	elif Interact.tripod_interactions >= 1:
		Interact.interact("tripod_2")
	
	Interact.tripod_interactions += 1

func run_green_screen_dialogue() -> void:
	Interact.interact("green_screen")

func run_couch_dialogue() -> void:
	Interact.interact("samantha_couch")
