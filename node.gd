extends Node
func _ready():
	var timer := Timer.new()
	timer.wait_time = 5.0  # 5 seconds
	timer.autostart = true
	timer.one_shot = false # Repeat indefinitely
	add_child(timer)
