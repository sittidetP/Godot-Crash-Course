extends Area2D

@export_file('*.tscn') var next_scene_path: String

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flag_idle_timer: Timer = $FlagIdleTimer

func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("flag_out")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "flag_out":
		animated_sprite_2d.play("flag_idle")
		flag_idle_timer.start()

func _on_flag_idle_timer_timeout() -> void:
	if not next_scene_path.is_empty():
		get_tree().change_scene_to_file(next_scene_path)
