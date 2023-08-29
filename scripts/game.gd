extends Panel

var empty_scene = preload("res://scenes/EmptyBlock.tscn")
var block_scene = preload("res://scenes/block.tscn")
var cursor_scene = preload("res://scenes/Cursor.tscn")
var point_scene = preload("res://scenes/point.tscn")

@onready var field = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/Panel
@onready var points = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/Panel/Points

var w := 62	# width
var p := 4	# padding
var full: int = w + p

var nbrs2 = [
	{ "value": 0, "type": "null", "neighbours": [1, 5] }, 
	{ "value": 0, "type": "null", "neighbours": [2, 6, 0] }, 
	{ "value": 0, "type": "null", "neighbours": [3, 7, 1] }, 
	{ "value": 0, "type": "null", "neighbours": [4, 8, 2] }, 
	{ "value": 0, "type": "null", "neighbours": [9, 3] }, 
	{ "value": 0, "type": "null", "neighbours": [0, 6, 10] }, 
	{ "value": 0, "type": "null", "neighbours": [1, 7, 11, 5] }, 
	{ "value": 0, "type": "null", "neighbours": [2, 8, 12, 6] }, 
	{ "value": 0, "type": "null", "neighbours": [3, 9, 13, 7] }, 
	{ "value": 0, "type": "null", "neighbours": [4, 14, 8] }, 
	{ "value": 0, "type": "null", "neighbours": [5, 11, 15] }, 
	{ "value": 0, "type": "null", "neighbours": [6, 12, 16, 10] }, 
	{ "value": 0, "type": "null", "neighbours": [7, 13, 17, 11] }, 
	{ "value": 0, "type": "null", "neighbours": [8, 14, 18, 12] }, 
	{ "value": 0, "type": "null", "neighbours": [9, 19, 13] }, 
	{ "value": 0, "type": "null", "neighbours": [10, 16, 20] }, 
	{ "value": 0, "type": "null", "neighbours": [11, 17, 21, 15] }, 
	{ "value": 0, "type": "null", "neighbours": [12, 18, 22, 16] }, 
	{ "value": 0, "type": "null", "neighbours": [13, 19, 23, 17] }, 
	{ "value": 0, "type": "null", "neighbours": [14, 24, 18] }, 
	{ "value": 0, "type": "null", "neighbours": [15, 21, 25] }, 
	{ "value": 0, "type": "null", "neighbours": [16, 22, 26, 20] }, 
	{ "value": 0, "type": "null", "neighbours": [18, 24, 28, 22] }, 
	{ "value": 0, "type": "null", "neighbours": [19, 29, 23] }, 
	{ "value": 0, "type": "null", "neighbours": [20, 26, 30] }, 
	{ "value": 0, "type": "null", "neighbours": [21, 27, 31, 25] }, 
	{ "value": 0, "type": "null", "neighbours": [22, 28, 32, 26] }, 
	{ "value": 0, "type": "null", "neighbours": [23, 29, 33, 27] }, 
	{ "value": 0, "type": "null", "neighbours": [24, 34, 28] }, 
	{ "value": 0, "type": "null", "neighbours": [25, 31] }, 
	{ "value": 0, "type": "null", "neighbours": [26, 32, 30] }, 
	{ "value": 0, "type": "null", "neighbours": [27, 33, 31] }, 
	{ "value": 0, "type": "null", "neighbours": [28, 34, 32] }, 
	{ "value": 0, "type": "null", "neighbours": [29, 33] }
]

var nbrs = [
	{"value": 0, "type": "null", "index": 0, "neighbours": [1, 5]},
	{"value": 0, "type": "null", "index": 1, "neighbours": [2, 6, 0]},
	{"value": 0, "type": "null", "index": 2, "neighbours": [3, 7, 1]},
	{"value": 0, "type": "null", "index": 3, "neighbours": [4, 8, 2]},
	{"value": 0, "type": "null", "index": 4, "neighbours": [9, 3]},
	{"value": 0, "type": "null", "index": 5, "neighbours": [0, 6, 10]},
	{"value": 0, "type": "null", "index": 6, "neighbours": [1, 7, 11, 5]},
	{"value": 0, "type": "null", "index": 7, "neighbours": [2, 8, 12, 6]},
	{"value": 0, "type": "null", "index": 8, "neighbours": [3, 9, 13, 7]},
	{"value": 0, "type": "null", "index": 9, "neighbours": [4, 14, 8]},
	{"value": 0, "type": "null", "index": 10, "neighbours": [5, 11, 15]},
	{"value": 0, "type": "null", "index": 11, "neighbours": [6, 12, 16, 10]},
	{"value": 0, "type": "null", "index": 12, "neighbours": [7, 13, 17, 11]},
	{"value": 0, "type": "null", "index": 13, "neighbours": [8, 14, 18, 12]},
	{"value": 0, "type": "null", "index": 14, "neighbours": [9, 19, 13]},
	{"value": 0, "type": "null", "index": 15, "neighbours": [10, 16, 20]},
	{"value": 0, "type": "null", "index": 16, "neighbours": [11, 17, 21, 15]},
	{"value": 0, "type": "null", "index": 17, "neighbours": [12, 18, 22, 16]},
	{"value": 0, "type": "null", "index": 18, "neighbours": [13, 19, 23, 17]},
	{"value": 0, "type": "null", "index": 19, "neighbours": [14, 24, 18]},
	{"value": 0, "type": "null", "index": 20, "neighbours": [15, 21, 25]},
	{"value": 0, "type": "null", "index": 21, "neighbours": [16, 22, 26, 20]},
	{"value": 0, "type": "null", "index": 22, "neighbours": [17, 23, 27, 21]},
	{"value": 0, "type": "null", "index": 23, "neighbours": [18, 24, 28, 22]},
	{"value": 0, "type": "null", "index": 24, "neighbours": [19, 29, 23]},
	{"value": 0, "type": "null", "index": 25, "neighbours": [20, 26, 30]},
	{"value": 0, "type": "null", "index": 26, "neighbours": [21, 27, 31, 25]},
	{"value": 0, "type": "null", "index": 27, "neighbours": [22, 28, 32, 26]},
	{"value": 0, "type": "null", "index": 28, "neighbours": [23, 29, 33, 27]},
	{"value": 0, "type": "null", "index": 29, "neighbours": [24, 34, 28]},
	{"value": 0, "type": "null", "index": 30, "neighbours": [25, 31]},
	{"value": 0, "type": "null", "index": 31, "neighbours": [26, 32, 30]},
	{"value": 0, "type": "null", "index": 32, "neighbours": [27, 33, 31]},
	{"value": 0, "type": "null", "index": 33, "neighbours": [28, 34, 32]},
	{"value": 0, "type": "null", "index": 34, "neighbours": [29, 33]}
]

var pathes = {}

var cells: Array

var start := Vector2(32, 32)

var count = 0

enum States {
	IDLE,
	MOVE,
	ADD,
	CHECK,
	TIMER
}

var state = States.IDLE

var remove_arr = []
var update_arr = []

var first_index := -1
var first_value := -1
var last_index := -1
var last_pos: Vector2
var cursor: Cursor

enum Countdowns {
	RUN,
	STOP
}

var countdown = Countdowns.RUN

var max = 2

func _ready():
	randomize()
	full = w + p
	_default_field()
	cells = nbrs.duplicate(true)
	for cell in cells:
		cell.obj = null
#	Events.connect("add_line", _add_line)
	Events.connect("add_line", _countdown)
	Events.connect("block_pressed", _block_pressed)
	Events.connect("block_drag", _block_drag)
	Events.connect("empty_drag", _empty_drag)
	Events.connect("block_drop", _block_drop)
	Events.connect("reset", _reset)
	_add_line()
	Events.emit_signal("start_timer")
	pass


func _default_field() -> void:
	var index = 0
	for y in range(7):
		for x in range(5):
			var empty = empty_scene.instantiate() as Cell
			empty.position = start + Vector2(x, y) * full
			empty.coordinates = Vector2(x, y)
			empty.index = index
			empty.neighbours = nbrs[index].neighbours
			$MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/Panel.add_child(empty)
			index += 1


func _countdown() -> void:
#	print(state)
	countdown = Countdowns.STOP
	if state == States.IDLE or state == States.MOVE:
		_add_line()
#	else:
#		countdown = Countdowns.STOP


func _add_line():
	if state == States.MOVE:
		_zeroing_cursor()
	for i in range(30):
		cells[i].obj = cells[i + 5].obj
		cells[i].value = cells[i + 5].value
	for i in range(30):
		if cells[i].obj:
			cells[i].obj.move_up()
	var new_line = Settings.calculate_line(max)
	for i in range(5):
#		count += 1
		var index = 30 + i
		var cell = block_scene.instantiate() as Block
		if count < 12:
			var val = new_line[i]
			if val > max: max = val
			cell.set_value(val)
			cell.index = index
			cell.position = start + Vector2(i, 6) * full
			field.add_child(cell)
			cells[index].obj = cell
			cells[index].value = val
			cells[index].type = "numb"
		else:
			count = 0
			var val = 100
			cell.set_diff_value(val)
			cell.index = index
			cell.position = start + Vector2(i, 6) * full
			field.add_child(cell)
			cells[index].obj = cell
			cells[index].value = val
			cells[index].type = "diff"
	state = States.CHECK
	$LtrsCoolDown.start()
	pass


func _on_ltrs_cool_down_timeout():
	_update_letters()
	match state:
		States.CHECK:
#			_remove_letters()
#			_check_vertical()
			_check_all_verticals()
		States.TIMER:
			_add_line()
		States.IDLE:
#			if count < 7:
#			if countdown == Countdowns.STOP:
#				countdown = Countdowns.RUN
##				count += 1
##				if count < 5:
#				Events.emit_signal("start_timer")
			pass


func _remove_letters() -> void:
	for index in remove_arr:
		for i in range(index, -1, -5):
			if i == index:
				cells[i].obj.queue_free()
			if i < 5:
				cells[i].obj = null
				cells[i].value = 0
				cells[i].type = "null"
			else:
				cells[i].obj = cells[i - 5].obj
				cells[i].value = cells[i - 5].value
				cells[i].type = cells[i - 5].type
	remove_arr = []


func _update_letters() -> void:
	for i in update_arr:
		if cells[i].obj:
			var new_val = cells[i].value + 1
			if new_val > max: max = new_val
			cells[i].value = new_val
			cells[i].obj.set_value(new_val)
	update_arr = []


func _check_all_verticals() -> void:
	var check = true
	for i in range(29, -1, -1):
		var next = 5 + i
		var val = cells[i].value
		if val > 0:
			if val == cells[next].value:
				check = false
				update_arr.append(next)
				cells[i].value = 0
				cells[i].obj.move_down(true)
				cells[i].obj = null
			elif cells[next].value == 0:
				check = false
				cells[next].value = cells[i].value
				cells[next].obj = cells[i].obj
				cells[i].value = 0
				cells[i].obj = null
				cells[next].obj.move_down()
	if update_arr.size() or !check:
		state = States.CHECK
	elif check:
		state = States.IDLE
		if countdown == Countdowns.STOP:
			countdown = Countdowns.RUN
			Events.emit_signal("start_timer")
#		else:
#			if countdown == Countdowns.READY:
#				countdown = Countdowns.IDLE
	$LtrsCoolDown.start()
	pass


func _block_pressed(index: int, pos: Vector2) -> void:
	if state == States.IDLE and first_index == -1 and cells[index].value > 0 && cells[index].value < 100:
		first_index = index
		first_value = cells[index].value
		last_index = index
		last_pos = pos
		state = States.MOVE
		cells[index].obj.set_opacity(false)
		for i in range(35):
			if cells[i].obj and cells[i].value == cells[index].value:
				cells[i].obj.set_collision(false)
		cursor = cursor_scene.instantiate() as Cursor
		cursor.set_value(first_value)
#		cursor.texture = Images.nums[str(first_value)]
		cursor.position = cells[index].obj.position
		field.add_child(cursor)
		path_finder()
#	print(index)

func _block_drag(index: int, pos: Vector2) -> void:
#	prints(state==States.MOVE, first_index, index)
	if state == States.MOVE and first_index >= 0:
		if index != last_index:
			if pathes.has(str(index)):
					last_index = index
					draw_points()
#					cursor.pos = pos
					cursor.position = pos
					last_pos = pos
#		if cells[index].value:
#			if index == first_index:
#				cursor.pos = pos
#				last_index = first_index
#				return
#			if _check_neighbours(index):
#				last_index = index
#				cursor.pos = cells[index].obj.position
#				pass
#		else:
##			if _check_neighbours(index, false):
#				last_index = index
#				cursor.pos = pos
##				cursor.move_and_collide(pos - cursor.position)
##				cursor.position = pos
	pass


func _empty_drag(index: int, pos: Vector2) -> void:
	if state == States.MOVE and first_index >= 0:
		if _check_neighbours(index, false):
			last_index = index
			cursor.position = pos
			pass
	pass
	
func _block_drop(index, pos: Vector2) -> void:
	pass


func _drop() -> void:
	if state == States.MOVE:
		var index = last_index
		clear_points()
		state = States.IDLE
		var val = cells[first_index].value
		var point = cursor.position.round()
		if first_index == index or last_index != index:
			cells[first_index].obj.set_opacity(true)
			_zeroing_cursor()
			return
		if cells[index].value:
			cells[first_index].obj.queue_free()
			cells[first_index].obj = null
			cells[first_index].value = 0
			var new_val = cells[index].value + 1
			if new_val > max: max = new_val
			cells[index].value = new_val
			cells[index].obj.set_value(new_val)
		else:
			cells[index].value = cells[first_index].value
			cells[index].obj = cells[first_index].obj
			cells[index].obj.set_opacity(true)
			cells[first_index].obj.position = last_pos
			cells[first_index].obj = null
			cells[first_index].value = 0
			
		for i in range(35):
			if cells[i].obj and cells[i].value == val:
				cells[i].obj.set_collision(true)
		_zeroing_cursor()
#		countdown = Countdowns.STOP
		_check_all_verticals()
	pass

func _zeroing_cursor() -> void:
	cursor.queue_free()
	clear_points()
	if cells[first_index].obj:
		cells[first_index].obj.set_opacity(true)
	cursor = null
	first_index = -1
	first_value = -1
	last_index = -1


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == 32:
			_print_values()
#		print(event)


func _print_values() -> void:
	for y in range(7):
		var line = ""
		for x in range(5):
			line += str(cells[y * 5 + x].value) + ", "
		print(line)
	print("----------------------------")


func _check_neighbours(index: int, check_value = true) -> bool:
#	prints(last_index, cells[index].neighbours, first_value, cells[index].value)
	var check = last_index in cells[index].neighbours
	if check_value:
		check = check and cells[index].value == first_value
	return check


func _on_exit_pressed():
	$Control.visible = true


func _reset() -> void:
	get_tree().reload_current_scene()


func path_finder() -> void:
	pathes = {}
	pathes[str(first_index)] = [first_index]
	var founded = [first_index]
	var arr = []
	var check = true
	var current_arr = [first_index]
	var next_arr = []
	while check:
		for i in current_arr:
			arr = pathes[str(i)]
			for n in cells[i].neighbours:
				if n not in founded:
					founded.append(n)
					if cells[n].value == 0:
						pathes[str(n)] = arr.duplicate()
						pathes[str(n)].append(n)
						next_arr.append(n)
					elif cells[n].value == first_value:
						pathes[str(n)] = arr.duplicate()
						pathes[str(n)].append(n)
		current_arr = next_arr.duplicate()
		next_arr = []
		if current_arr.size() == 0:
			check = false
#	print(pathes)
	pass


func clear_points() -> void:
	for p in points.get_children():
		p.queue_free()


func draw_points() -> void:
	clear_points()
	print(pathes[str(last_index)])
	var path = pathes[str(last_index)]
	for p in path:
		var y = floor(p / 5.0)
		var x = p - y * 5
		var point = point_scene.instantiate()
		point.position = (Vector2(x, y) + Vector2(0.5, 0.5)) * full
		points.add_child(point)
	pass


func _on_gui_input(event):
	if event is InputEventScreenTouch and event.index == 0 and !event.pressed:
		_drop()
	pass # Replace with function body.


func _on_ice_pressed():
	Events.emit_signal("pause_timer")
	pass # Replace with function body.


func _on_bomb_pressed():
	pass # Replace with function body.


func _on_stone_pressed():
	pass # Replace with function body.
