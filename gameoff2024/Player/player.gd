extends CharacterBody2D

@export var mp: MovementPack

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var idle_anim = "foreward"

@onready var down: CollisionShape2D = $InteractionArea/Down
@onready var up: CollisionShape2D = $InteractionArea/Up
@onready var left: CollisionShape2D = $InteractionArea/Left
@onready var right: CollisionShape2D = $InteractionArea/Right


func _physics_process(delta: float):
	play_anims()
	move(delta)
	update_areas()

func move(delta):
	var input = get_input().normalized()
	
	if input == Vector2.ZERO:
		frict(delta)
		
	elif input != Vector2.ZERO:
		acc(delta, input)
	
	move_and_slide()

func get_input():
	
	if Global.current_game_state != Global.game_states.PLAY:
		return Vector2.ZERO
	
	var input_axis = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		input_axis.x = -1
		
	elif Input.is_action_pressed("right"):
		input_axis.x = 1

	if Input.is_action_pressed("up"):
		input_axis.y = -1
		
	elif Input.is_action_pressed("down"):
		input_axis.y = 1 
	
	return input_axis

func acc(delta, direction):
	if Input.is_action_pressed("run"):
		velocity.x = move_toward(velocity.x, mp.run_speed * direction.x, mp.acc * delta)
		velocity.y = move_toward(velocity.y, mp.run_speed * direction.y, mp.acc *delta)
	else:
		velocity.x = move_toward(velocity.x, mp.speed * direction.x, mp.acc * delta)
		velocity.y = move_toward(velocity.y, mp.speed * direction.y, mp.acc * delta)

func frict(delta):
	velocity.x = move_toward(velocity.x, 0, mp.frict * delta)
	velocity.y = move_toward(velocity.y, 0, mp.frict * delta)

func play_anims():
	var current_anim: String

	if Input.is_action_pressed("down"):
		current_anim = "walk_foreward"
		idle_anim = "foreward"
		animated_sprite_2d.flip_h = false
		
	elif Input.is_action_pressed("up"):
		current_anim = "walk_back"
		idle_anim = "back"
		animated_sprite_2d.flip_h = false
		
	elif Input.is_action_pressed("right"):
		current_anim = "walk_side"
		idle_anim = "side"
		animated_sprite_2d.flip_h = false
		
	elif Input.is_action_pressed("left"):
		current_anim = "walk_side"
		idle_anim = "side"
		animated_sprite_2d.flip_h = true
	
	if velocity == Vector2.ZERO:
		current_anim = "idle_" + idle_anim
	
	animated_sprite_2d.play(current_anim)

func update_areas():
	if Input.is_action_pressed("right"):
		enable_area(right, left, down, up)
	elif Input.is_action_pressed("left"):
		enable_area(left, right, down, up)
	
	if Input.is_action_pressed("down"):
		enable_area(down, up, left, right)
	elif Input.is_action_pressed("up"):
		enable_area(up, down, left, right)

func enable_area(enabled_area, disabled_area_1, disabled_area_2, disabled_area_3):
	enabled_area.disabled = false
	disabled_area_1.disabled = true 
	disabled_area_2.disabled = true 
	disabled_area_3.disabled = true 
