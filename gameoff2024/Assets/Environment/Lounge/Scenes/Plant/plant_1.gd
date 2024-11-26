extends Node2D

@export var is_torn = false 
@export var is_interactable = false

@onready var default: AnimatedSprite2D = $default
@onready var torn: AnimatedSprite2D = $torn

func _ready() -> void:
	Dialogic.signal_event.connect(tear_leaf)
	if !Interact.leaf_torn and is_interactable:
		torn.visible = false
		default.visible = true
	elif Interact.leaf_torn and is_interactable:
		torn.visible = true
		default.visible = false

func tear_leaf(arg) -> void:
	if arg == "tear" and is_interactable:
		torn.visible = true
		default.visible = false
		Interact.leaf_torn = true
		
