extends CharacterBody2D
class_name Cursor

var index: int

var value: int

var coordinates: Vector2

var neighbours: Array

var pos: Vector2

var speed = 700

func set_value(val: int) -> void:
	value = val
	$Cursor/image.texture = Images.nums[str(val)]
	pass


func set_diff_value(val: int) -> void:
	value = val
	$Cursor/image.texture = Images.diff[str(val)]
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


func _physics_process(delta):
	velocity = Vector2.ZERO
	if pos:
		if pos.distance_to(position) > 5:
			velocity = position.direction_to(pos) * speed
			move_and_slide()
#			move_and_collide(position.direction_to(pos) * speed)
		else:
			position = pos
	pass
