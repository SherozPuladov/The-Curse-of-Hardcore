extends Area2D

@export var level: Node2D

func player_entered(body):
	print(body)
	level.emit_signal("player_won")
