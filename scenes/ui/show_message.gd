extends Label

class_name ShowMessage

@export var timer: Timer
@export var time_to_appear: float = 1.0
@export var appear_color: Color
@export var time_to_disappear: float = 1.0
@export var disappear_color: Color


func _ready():
	timer.connect("timeout", disappear)
	show_message("")


func show_message(message: String):
	text = message
	appear()
	timer.start()


func appear():
	var tween = create_tween()
	tween.tween_property(self, "modulate", appear_color, time_to_appear).from(disappear_color)


func disappear():
	var tween = create_tween()
	tween.tween_property(self, "modulate", disappear_color, time_to_disappear).from(appear_color)
