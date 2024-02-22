extends Node2D

class_name MovingPlatform

@export var auto_move: bool = true
@export var can_rotate: bool = true
@export var repeat: int = -1
@export var moving_time: float = 1
@export var platform: Node2D
@export var movement_markers: Node2D


func _ready():
	if auto_move:
		move(repeat)


func move(loops: int):
	var tween = create_tween()
	tween.set_loops(loops)
	
	var markers = movement_markers.get_children()
	
	for marker in markers:
		tween.tween_property(platform, "global_position", marker.global_position, moving_time)
		if can_rotate:
			tween.tween_property(platform, "global_rotation", marker.global_rotation, moving_time)
