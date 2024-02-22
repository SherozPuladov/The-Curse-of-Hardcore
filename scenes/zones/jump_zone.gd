extends Area2D

@export var jump_velocity_multiplier: float = 2.0


func jump_velocity_up(body):
	body.jump_velocity *= jump_velocity_multiplier


func jump_velocity_down(body):
	body.jump_velocity /= jump_velocity_multiplier
