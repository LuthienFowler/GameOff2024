extends Node

func _ready() -> void:
	Interact.interacted.connect(interact)

func interact(interactable_name) -> void:
	match interactable_name:
		"fire_place":
			fire_place_dialogue()
		"bookshelf":
			book_shelf_dialogue()
		"couch":
			couch_dialogue()

func fire_place_dialogue() -> void:
	Interact.interact("fire_place_dialogue_1")
	Interact.fire_place_interactions += 1

func book_shelf_dialogue() -> void:
	if Interact.book_shelf_interactions == 0: 
		Interact.interact("empty_book_shelves_1")
	elif Interact.book_shelf_interactions > 0:
		Interact.interact("empty_book_shelves_2")

	Interact.book_shelf_interactions += 1

func couch_dialogue() -> void:
	if Interact.couch_1_interactions == 0:
		Interact.interact("couch_dialogue_1")
	elif Interact.couch_1_interactions > 0:
		Interact.interact("couch_dialogue_2")
	
	Interact.couch_1_interactions += 1 
