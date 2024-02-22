extends Area2D

class_name Item

signal accept_item(item: String, count: int)

@export var item: String = "chance"
@export var count: int = 1
@export var rotation_velocity: float = 1.0

func _on_body_entered(_body):
	accept_item.emit(item, count)
	queue_free()

func _process(delta):
	rotation += rotation_velocity * delta
