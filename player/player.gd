extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var facing_direction: int = 1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

const ONE_WAY_COLLISION_MARGIN := 1

func _physics_process(delta: float) -> void:
	handle_in_air(delta)

	var direction := Input.get_axis("move_left", "move_right")
	
	handle_move(direction)
	
	if Input.is_action_just_pressed("drop"):
		position.y += ONE_WAY_COLLISION_MARGIN
		
	flip(int(direction))
	
	handle_animation()

	move_and_slide()

func handle_in_air(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		audio_stream_player.play()
		velocity.y = JUMP_VELOCITY

func handle_move(direction: float) -> void:
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
func flip(direction: int) -> void:
	if (facing_direction != direction and direction != 0):
		animated_sprite_2d.flip_h = direction == -1
	facing_direction = direction
	
func handle_animation() -> void:
	if is_on_floor():
		if velocity.x != 0.0:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
	else:
		if velocity.y < 0.0:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")
	
