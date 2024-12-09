extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -400.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var facing_direction := 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	var direction := Input.get_axis("move_left", "move_right")
	flip(int(direction))
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	handle_animation()

	move_and_slide()

func flip(direction: int) -> void:
	if (direction):
		facing_direction = direction
		animated_sprite_2d.flip_h = facing_direction == -1

func handle_animation() -> void:
	if is_on_floor():
		if velocity.x:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
	else:
		if velocity.y >= 0.0:
			animated_sprite_2d.play("fall")
		else:
			animated_sprite_2d.play("jump")
