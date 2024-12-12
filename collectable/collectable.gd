extends Area2D

var collected_effect_scene : PackedScene = load("res://collectable/collected_effect_animated_sprite_2d.tscn")

func _on_body_entered(body: Node2D) -> void:
	var collected_effect : Node2D = collected_effect_scene.instantiate()
	collected_effect.global_position = global_position
	get_tree().current_scene.add_child(collected_effect)
	queue_free()
