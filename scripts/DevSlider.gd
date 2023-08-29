extends HBoxContainer


func set_value(val: float):
	$HSlider.value = val
	$TextEdit.text = str(val)


func get_value() -> float:
	return $HSlider.value


func _on_h_slider_value_changed(value):
	$TextEdit.text = str(value)
	pass # Replace with function body.
