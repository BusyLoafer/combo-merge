extends Cell
class_name Block


func set_value(val: int) -> void:
	value = val
	$image.texture = Images.nums[str(val)]
	pass


func set_diff_value(val: int) -> void:
	value = val
	$image.texture = Images.diff[str(val)]
	pass


func move_up() -> void:
	index -=5
	var tw: Tween = create_tween()
	tw.tween_property(self, "position:y", position.y - 66, 0.2)
	

func move_down(finish = false) -> void:
	index += 5
	var tw: Tween = create_tween()
	tw.tween_property(self, "position:y", position.y + 66, 0.2)
	if finish:
		await tw.finished
		queue_free()


func set_z_sort() -> void:
	set_z_index(1)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.index == 0:
		if event.pressed:
			Events.emit_signal("block_pressed", index)
		else:
			Events.emit_signal("block_drop", index)
	elif event is InputEventScreenDrag and event.index == 0:
		Events.emit_signal("block_drag", index, position)
	pass # Replace with function body.


func set_collision(value: bool) -> void:
#	$StaticBody2D/CollisionShape2D.disabled = !value
	pass


func set_opacity(value: bool) -> void:
	$image.modulate = Color("#ffffff73") if !value else Color("#ffffff")
	pass
