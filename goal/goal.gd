extends Area2D

@export_file("*.tscn") var next_scene_path: String

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flag_idle_timer: Timer = $FlagIdleTimer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var is_enter := false

func _ready() -> void:
	# manual signal connecting example
	flag_idle_timer.timeout.connect(_on_flag_idle_timer_time_out)

func _on_body_entered(_body: Node2D) -> void:
	if is_enter: return
	
	if get_tree().get_node_count_in_group("collectables") == 0:
		is_enter = true
		StageManager.is_stage_finish = true
		audio_stream_player.play()
		animated_sprite_2d.play("flag_out")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "flag_out":
		animated_sprite_2d.play("flag_idle")
		flag_idle_timer.start()

func _on_flag_idle_timer_time_out() -> void:
	if not next_scene_path.is_empty():
		get_tree().change_scene_to_file(next_scene_path)
