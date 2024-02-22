extends Node2D

signal player_is_dead
signal player_won
signal pause_game
signal continue_game_emit

@export var control_points: ControlPoints
@export var items_manager: ItemsManager
@export var player: CharacterBody2D


func _ready():
	player.position = control_points.get_current_control_point_position()


func _process(_delta):
	if Input.is_action_just_pressed("pause_game"):
		if get_tree().paused == false:
			pause_game.emit()
			_pause_game()
		else:
			continue_game_emit.emit()
			_unpause_game()
	
	if Input.is_action_just_pressed("quit_game"):
		quit_game()


func respawn():
	if items_manager.chance > 0:
		player.position = control_points.get_current_control_point_position()
		items_manager.chance -= 1
		_unpause_game()
	else:
		player_is_dead.emit()


func continue_game(): 
	print("continue")
	_unpause_game()


func restart():
	_unpause_game()
	get_tree().reload_current_scene()


func quit_game():
	get_tree().quit()


func _unpause_game():
	get_tree().paused = false


func _pause_game():
	get_tree().paused = true


func _go_home():
	get_tree().change_scene_to_file("res://scenes/ui/home.tscn")
