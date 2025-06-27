extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var last_direction_left := false 

func jump():
	velocity.y = JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get horizontal input
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		last_direction_left = direction < 0 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move character
	move_and_slide()

	# Flip sprite based on last movement direction
	sprite_2d.flip_h = last_direction_left

	if not is_on_floor():
		sprite_2d.animation = "jump"
	elif abs(velocity.x) > 1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "idle"

	sprite_2d.play()
