extends Node2D
class_name ScoreUp

var colors = [
	"#38D4FF",
	"#5E8BFF",
	"#DC630C",
	"#DC630C",
	"#DC630C",
	"#DC630C"
]

var val: int


func _ready():
	if val:
		if val > 1:
			$Node2D/Label.add_theme_color_override("font_color", Color(colors[val]))
			$Node2D/Label.text = "Combo x" + str(val)


func set_params(index: int, value: int) -> void:
	var y = floor(index / 5.0)
	var x = index - y * 5
	position = Vector2(x, y) * 66 + Vector2(40, 20)
	val = value
