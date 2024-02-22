extends Node2D

class_name ControlPoints

@export var respawn_point: Node2D
@export var current_control_point: Node2D
@export var standart_control_point_color: Color
@export var current_control_point_color: Color

func _ready():
	for child in get_children():
		child.connect("accept_new_control_point", new_current_control_point)


func get_respawn_point_position():
	return respawn_point.global_position


func get_current_control_point_position():
	if current_control_point == null:
		return respawn_point.global_position
	else:
		return current_control_point.global_position


func new_current_control_point(point: Node2D):
	if current_control_point != null:
		current_control_point.update_color(standart_control_point_color)
	current_control_point = point
	current_control_point.update_color(current_control_point_color)
