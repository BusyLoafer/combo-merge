extends Panel

var slider_scene = preload("res://scenes/DevSlider.tscn")

@onready var sliders = $MarginContainer/VBoxContainer2/ScrollContainer/VBoxContainer

func _ready():
	for i in Settings.weights.size():
		sliders.get_child(i + 1).set_value(Settings.weights[i])
	sliders.get_child(0).set_value(Settings.base_timer)
	pass


func _on_visibility_changed():
#	print(visible)
	pass


func _on_button_pressed():
	_save()
	visible = false
	Events.emit_signal("reset")
	pass # Replace with function body.


func _save() -> void:
	var arr = []
	for i in sliders.get_child_count():
		var ch = sliders.get_child(i)
		if i == 0:
			Settings.base_timer = ch.get_value()
		else:
			arr.append(int(ch.get_value()))
	Settings.weights = arr
	pass
