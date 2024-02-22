extends Area2D

@export var teleport_to: Node2D

func teleport(body):
	body.global_position = teleport_to.global_position
