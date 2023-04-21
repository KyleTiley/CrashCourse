extends Node2D

@onready var timer = $Timer
var timer_value = 0

func _ready():
	timer.set_wait_time(0.1)
	timer.start()

func _on_timer_timeout():
	timer_value += 1
	GlobalScript.Main_Score = timer_value
