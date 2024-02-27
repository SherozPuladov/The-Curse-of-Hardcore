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
	
	match(LevelGlobals.chance_count):
		5:
			select(0)
		3:
			select(1)
		1:
			select(2)
		0:
			select(3)


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
