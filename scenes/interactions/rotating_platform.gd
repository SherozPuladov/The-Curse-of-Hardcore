extends Node2D

class_name RotatingPlatform

@export var can_rotate: bool = true
@export var rotation_velocity: float = 1.0


func _process(delta):
	if can_rotate:
		rotation += rotation_velocity * delta
