extends Label

var start_time: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StageManager.is_stage_finish = false
	start_time = Time.get_ticks_msec()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not StageManager.is_stage_finish:
		text = str((Time.get_ticks_msec() - start_time) / 1000.0 )
