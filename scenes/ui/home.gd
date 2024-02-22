class_name Home extends Node2D

@onready var home_ui: CanvasLayer = $HomeUI
@onready var tile_button_container: HBoxContainer = $HomeUI/ScrollContainer/HBoxContainer
@onready var tile_button: PackedScene = preload("res://scenes/ui/tile_button.tscn")
var levels_container = LevelsContainer.new()


func _ready():
	show_a_list_of_levels(levels_container.Level)


func show_a_list_of_levels(list_of_levels):
	for level_name in list_of_levels.keys():
		var b = tile_button.instantiate()
		tile_button_container.add_child(b)
		b.title = "Level " + str(level_name)
		b.value = level_name
		b.connect("tile_button_pressed", start_the_level)


func start_the_level(level):
	load_scene(levels_container.Level[level])


func load_scene(scene_path):
	get_tree().change_scene_to_file(scene_path)
