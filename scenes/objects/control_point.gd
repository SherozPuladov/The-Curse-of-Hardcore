extends Area2D

signal accept_new_control_point(point: Node2D)

@onready var left_color_rect: ColorRect = $LeftColorRect
@onready var right_color_rect: ColorRect = $RightColorRect


func update_control_point(_body):
	accept_new_control_point.emit(self)

func update_color(color: Color):
	left_color_rect.color = color
	right_color_rect.color = color
