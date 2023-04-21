extends Node

func _ready():
	get_tree().paused = true
#	await get_tree().create_timer(1).timeout
	get_tree().paused = false
