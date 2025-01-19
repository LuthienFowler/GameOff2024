extends Node2D

@onready var click: AudioStreamPlayer2D = $Click
@onready var stat: AudioStreamPlayer2D = $Static

func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signal)

func dialogic_signal(arg) -> void:
	if arg == "click":
		click.play()
	
	if arg == "static_on":
		stat.play()
	elif arg == "static_off":
		stat.stop()
