class_name TileButton extends Button

signal tile_button_pressed(v)

@onready var titleLabel: Label = $Title
@onready var backgroundLabel: Label = $BackgroundLabel
var value


var title: String :
	set(value):
		title = value.to_upper()
		titleLabel.text = title
		backgroundLabel.text = title
	get:
		return title


func _ready():
	title = text
	text = ""


func _pressed():
	tile_button_pressed.emit(value)
