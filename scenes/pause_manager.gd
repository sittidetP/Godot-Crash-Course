extends Node

@export var pause_color_rect: ColorRect

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		
		if pause_color_rect:
			pause_color_rect.visible = get_tree().paused
