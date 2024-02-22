extends OptionButton

var options = [
	"WOMAN",
	"MAN",
	"REAL MAN",
	"GIGACHAD"
]

func _ready():
	for i in options:
		add_item(i)
	select(0)



func _on_item_selected(index):
	match(options[index]):
		"WOMAN":
			LevelGlobals.chance_count = 5
			LevelGlobals.jump_count = 5
		"MAN":
			LevelGlobals.chance_count = 3
			LevelGlobals.jump_count = 3
		"REAL MAN":
			LevelGlobals.chance_count = 1
			LevelGlobals.jump_count = 1
		"GIGACHAD":
			LevelGlobals.chance_count = 0
			LevelGlobals.jump_count = 0
