extends ProgressBar

@export var def_time = 10.0

var progress_base = preload("res://themes/progress.tres")
var progress_buff = preload("res://themes/progress_buf.tres")

var cur_time := 10.0

func _ready():
	def_time = Settings.base_timer
	cur_time = def_time
	Events.connect("start_timer", _start_timer)
	Events.connect("pause_timer", _pause_timer)
#	$BaseTimer.start(cur_time)


func _process(delta):
	value = $BaseTimer.time_left / cur_time * 100
	pass


func _start_timer() -> void:
	cur_time = def_time
	$BaseTimer.start(cur_time)
	pass


func _pause_timer() -> void:
	if !$BaseTimer.paused:
		add_theme_stylebox_override("fill", progress_buff)
		$BaseTimer.paused = true
		var point = size.x * ($BaseTimer.time_left / $BaseTimer.wait_time)
		$stars.position.x = point
		$stars.visible = true
		$stars.restart()
		$PauseTimer.start()


func _on_base_timer_timeout():
	Events.emit_signal("add_line")


func _on_pause_timer_timeout():
	$BaseTimer.paused = false
	$stars.emitting = false
	$stars.visible = false
	add_theme_stylebox_override("fill", progress_base)
	pass # Replace with function body.
