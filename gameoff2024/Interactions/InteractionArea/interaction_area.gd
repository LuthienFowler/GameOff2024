extends Area2D

@export var interactable_name: String
var player_present = false

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerInteractionAreas"):
		player_present = true

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("PlayerInteractionAreas"):
		player_present = false
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and player_present:
		Interact.interacted.emit(interactable_name)
