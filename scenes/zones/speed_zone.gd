extends Area2D

@export var speed_multiplier: float = 2.0


func speed_up(body):
	body.speed *= speed_multiplier


func speed_down(body):
	body.speed /= speed_multiplier
