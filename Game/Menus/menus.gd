extends Control

@onready var camera = $"../MenuCamera"
@onready var game_scene
@onready var main_audio_bus = AudioServer.get_bus_index("Master")

var move_camera_width = 960
var canClick

func _ready():
	game_scene = load("res://Game/game.tscn")
	canClick = true

func move_camera_right():
	var tween = create_tween()
	tween.tween_property(camera, "position",
	camera.position + Vector2(move_camera_width, 0), 1).set_trans(Tween.TRANS_EXPO)
	await get_tree().create_timer(1).timeout
	canClick = true

func move_camera_left():
	var tween = create_tween()
	tween.tween_property(camera, "position",
	camera.position - Vector2(move_camera_width, 0), 1).set_trans(Tween.TRANS_EXPO)
	await get_tree().create_timer(1).timeout
	canClick = true

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Game/game.tscn")

func _on_how_to_button_pressed():
	if(canClick):
		canClick = false
		move_camera_right()

func _on_back_button_pressed():
	if(canClick):
		canClick = false
		move_camera_left()

func _on_settings_button_pressed():
	if(canClick):
		canClick = false
		move_camera_left()

func _on_back_button_2_pressed():
	if(canClick):
		canClick = false
		move_camera_right()

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(main_audio_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(main_audio_bus, true)
	else:
		AudioServer.set_bus_mute(main_audio_bus, false)
