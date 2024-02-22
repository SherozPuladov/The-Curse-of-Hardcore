extends CanvasLayer

signal reload_level
signal continue_game
signal exit_game
signal suicide
signal pause_game

@export var chance_label: Label
@export var double_jump_label: Label
@export var show_message: ShowMessage

@onready var itemsPanel: Panel = $ItemsPanel
@onready var losePanel: Panel = $LosePanel
@onready var winPanel: Panel = $WinPanel
@onready var pausePanel: Panel = $PausePanel


func _ready():
	_hide(losePanel)
	_hide(winPanel)
	_hide(pausePanel)
	_show(itemsPanel)


func update_item_label(item: String, count: int):
	match item:
		"chance":
			chance_label.text = str(count)
		"double_jump":
			double_jump_label.text = str(count)


func cause_of_dead(m: String):
	show_message.show_message(m)


func show_items_panel():
	_hide(winPanel)
	_hide(losePanel)
	_hide(pausePanel)
	_show(itemsPanel)


func show_lose_panel():
	_hide(itemsPanel)
	_hide(winPanel)
	_show(losePanel)


func show_win_panel():
	_hide(itemsPanel)
	_hide(losePanel)
	_show(winPanel)


func show_pause_panel():
	_hide(losePanel)
	_hide(winPanel)
	_hide(itemsPanel)
	_show(pausePanel)


func continue_game_emit():
	show_items_panel()
	continue_game.emit()


func quit_game_emit():
	exit_game.emit()


func reload_scene():
	reload_level.emit()


func pause_button():
	get_tree().paused = true


func _show(n):
	n.visible = true

func _hide(n):
	n.visible = false
