extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	reload_scene_normal_ways()
	
	# If has error "current scene is null" and its bother you, Use this below instead.
	#reload_scene_with_current_scene_path()

func reload_scene_normal_ways() -> void:
	get_tree().call_deferred("reload_current_scene")

func reload_scene_with_current_scene_path() -> void:
	var current_scene_file_path := get_tree().current_scene.scene_file_path
	get_tree().call_deferred("change_scene_to_file", current_scene_file_path)
