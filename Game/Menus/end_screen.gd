extends Node

@onready var endLabel = $HowToMenu/Panel/EndscoreLabel

func _ready():
	$AudioStreamPlayer2D.play()
	endLabel.text = str(GlobalScript.Main_Score)


func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://Game/game.tscn")


func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Game/Menus/menus.tscn")
