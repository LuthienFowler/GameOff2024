extends CanvasLayer

var open = false

func _ready():
	open = false
	visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game_menu") and !open:
		visible = true
		open = true
		Global.current_game_state = Global.game_states.GAME_MENU

func _on_return_to_game_pressed() -> void:
	visible = false
	open = false
	Global.current_game_state = Global.game_states.PLAY

func _on_main_menu_pressed() -> void:
	RoomTransitions.change_room("res://Menus/MainMenu/main_menu.tscn")
