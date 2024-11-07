extends CharacterBody2D

@export var mp: MovementPack
@export var gp: GravityPack

@onready var jump_velocity = ((2.0 * gp.jump_height) / gp.jump_time_to_peak) * -1 
@onready var jump_gravity = ((-2.0 * gp.jump_height) / (gp.jump_time_to_peak * gp.jump_time_to_peak)) * -1
@onready var fall_gravity = ((-2.0 * gp.jump_height) / (gp.jump_time_to_descent * gp.jump_time_to_descent)) * -1

func _physics_process(delta: float):
	move(delta)
	jump()
	velocity.y += apply_gravity() * delta

func move(delta):
	var input = get_input()
	
	if input == 0:
		frict(delta)
	elif input != 0:
		acc(delta, input)
	
	move_and_slide()

func get_input():
	var x_axis = 0
	
	if Input.is_action_pressed("left"):
		x_axis = -1 
	elif Input.is_action_pressed("right"):
		x_axis = 1 
	
	return x_axis

func acc(delta, direction):
	if Input.is_action_pressed("run"):
		velocity.x = move_toward(velocity.x, mp.run_speed * direction, mp.acc * delta)
	else:
		velocity.x = move_toward(velocity.x, mp.speed * direction, mp.acc * delta)

func frict(delta):
	velocity.x = move_toward(velocity.x, 0, mp.frict * delta)

func apply_gravity():
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
