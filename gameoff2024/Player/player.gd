extends CharacterBody2D

@export var mp: MovementPack

func _physics_process(delta: float):
	move(delta)

func move(delta):
	var input = get_input().normalized()
	
	if input == Vector2.ZERO:
		frict(delta)
	elif input != Vector2.ZERO:
		acc(delta, input)
	
	move_and_slide()

func get_input():
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
