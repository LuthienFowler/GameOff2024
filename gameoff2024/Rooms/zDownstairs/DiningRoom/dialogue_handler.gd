extends Node


func _on_kitchen_area_entered(area: Area2D) -> void:
	if !area.is_in_group("PlayerInteractionAreas"): return
	
	if Interact.try_go_upstairs == false:
		Interact.interact("kitchen_dialogue_1")
	elif Interact.try_go_upstairs == true:
		Interact.interact("kitchen_dialogue_2")
