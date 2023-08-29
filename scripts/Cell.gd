extends Node2D
class_name Cell

var index: int

var value: int

var coordinates: Vector2

var neighbours: Array


func _on_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.index == 0:
		if event.pressed:
			Events.emit_signal("block_pressed", index, position)
		else:
			Events.emit_signal("block_drop", index, position)
	if event is InputEventScreenDrag and event.index == 0:
		Events.emit_signal("block_drag", index, position)
	pass # Replace with function body.
