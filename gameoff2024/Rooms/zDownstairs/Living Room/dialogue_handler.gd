extends Node

func _ready() -> void:
	Interact.interacted.connect(interact)

func interact(interactable_name) -> void:
	match interactable_name:
		"fire_place":
			fire_place_dialogue()

func fire_place_dialogue() -> void:
	if Interact.fire_place_interactions == 0: Interact.interact("fire_place_dialogue_1")
	Interact.fire_place_interactions += 1
