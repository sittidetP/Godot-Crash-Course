extends Button

@export var first_stage_scene: PackedScene


func _on_pressed() -> void:
	if first_stage_scene:
		get_tree().change_scene_to_packed(first_stage_scene)
