extends "res://Game/Vehicles/vehicle_base.gd"

# VARIABLES
# Turn angle of vehicle
var turn_angle = 2.0
var speed = 2000.0
var turn = 1
var time_since_action = 0

var squash_and_stretch = Vector3(0, 0, 2)

func get_input(delta):
	speed_increase(delta)
	if Input.is_action_just_pressed("Single_Action"):
		turn = -turn
		scale.lerp(squash_and_stretch, 0.5)
#		scale.z = scale.z*0.5
	
	steer_angle = -turn * deg_to_rad(turn_angle)
	
	$wheel_front_left.rotation.y = -steer_angle*2
	$wheel_front_right.rotation.y = -steer_angle*2
	
	acceleration = Vector3.ZERO
	acceleration = transform.basis.z * speed

# Increases speed as the game progresses
func speed_increase(delta):
	print(speed)
	speed += delta*10

# fix this??
#func _on_area_3d_body_entered(body):
#	if body == $NPC_Car:
#		print("HIT")

func _on_area_3d_body_entered(body):
	if body.is_in_group("NPC") or body.is_in_group("Obstacle"):
		get_tree().change_scene_to_file("res://Game/Menus/end_screen.tscn")
