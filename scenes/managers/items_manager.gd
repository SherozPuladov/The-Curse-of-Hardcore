extends Node2D

class_name ItemsManager

signal update_label(item: String, count: int)


@export var chance = 0:
	set(value):
		chance = value
		update_label.emit("chance", chance)

@export var double_jump = 0:
	set(value):
		double_jump = value
		update_label.emit("double_jump", double_jump)


func _ready():
	chance = LevelGlobals.chance_count
	double_jump = LevelGlobals.jump_count
	var items = get_children()
	for i in items:
		i.connect("accept_item", _accept_item)


func _accept_item(item: String, count: int):
	match item:
		"chance":
			chance += count
		"double_jump":
			double_jump += count
