extends Node

func _ready() -> void:
	Interact.interacted.connect(interact)

func interact(interactable_name) -> void:
	match interactable_name:
		"sus_plant":
			sus_plant_dialogue()
		"lounge_couch":
			lounge_couch_dialogue()
		"leafy_plant":
			leafy_plant_dialogue()
		"spider_plant":
			spider_plant_dialogue()
		"tv":
			tv_dialogue()

func sus_plant_dialogue() -> void:
	if Interact.sus_plant_interactions == 0:
		Interact.interact("suspicious_plant_1")
	elif Interact.sus_plant_interactions == 1:
		Interact.interact("suspicious_plant_2")
	elif Interact.sus_plant_interactions > 1:
		Interact.interact("suspicious_plant_3")
	
	Interact.sus_plant_interactions += 1

func lounge_couch_dialogue() -> void:
	Interact.interact("lounge_couch_dialogue")

func leafy_plant_dialogue() -> void:
	Interact.interact("leafy_plant")

func spider_plant_dialogue() -> void:
	Interact.interact("spider_plant")

func tv_dialogue() -> void:
	pass
