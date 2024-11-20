extends Area2D

@export var collected_effect_scene: PackedScene

# if you considered, that has specific effect then you can use load() or preload() like below
var another_collected_effect_scene := load("res://collectable/collected_effect_animated_sprite_2d.tscn")


func _on_body_entered(body: Node2D) -> void:
	#instantiate_effect_from_export()
	
	instantiate_effect_from_load()
	
	queue_free()

func instantiate_effect_from_export() -> void:
	if collected_effect_scene != null:
		var collected_effect := collected_effect_scene.instantiate() as Node2D
		collected_effect.global_position = global_position
		get_tree().current_scene.add_child(collected_effect)

func instantiate_effect_from_load() -> void:
	var collected_effect := another_collected_effect_scene.instantiate() as Node2D
	collected_effect.global_position = global_position
	get_tree().current_scene.add_child(collected_effect)
