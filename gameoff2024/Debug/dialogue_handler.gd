extends Node

func _ready() -> void:
	Interact.interacted.connect(interact)

func interact(interactable_name):
	match interactable_name:
		"wall":
			run_wall_dialogue()

func run_wall_dialogue():
	Interact.interact("Debug1")
