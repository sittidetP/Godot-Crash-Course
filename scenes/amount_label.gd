extends Label

var total_collectables: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var current := total_collectables - get_tree().get_node_count_in_group("collectables")
	
	text = "{current} / {total}".format({"current": current,"total": total_collectables})

func _on_get_total_timer_timeout() -> void:
	total_collectables = get_tree().get_node_count_in_group("collectables")
