extends "res://Game/Vehicles/vehicle_base.gd"

# VARIABLES
# Turn angle of vehicle
var turn_angle = 2.0
# How fast this vehicle goes
var speed = 2000.0
var turn = 0 
var time_since_action = 0
var count_time = false
var spawn_position = Vector3.ZERO

func _ready():
	spawn_position = global_transform.origin

func get_input(delta):
	if count_time:
		time_since_action += delta
	if Input.is_action_just_pressed("Single_Action"):
		count_time = true
		turn = -turn
#		if time_since_action > 1:
#
#		else:
#			print("JUMP")
	steer_angle = -turn * deg_to_rad(turn_angle)
	
	acceleration = Vector3.ZERO
	acceleration = transform.basis.z * speed

func _on_area_3d_body_entered(body):
	if body.is_in_group("Obstacle") or body.is_in_group("Player"):
		$AudioStreamPlayer3D.play()
		if body.is_in_group("Player"):
			get_tree().change_scene_to_file("res://Game/Menus/end_screen.tscn")
		global_transform.origin = spawn_position
		print("NPC CRASH")
