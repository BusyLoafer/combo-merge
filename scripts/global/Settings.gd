extends Node

var base_timer = 5

var weights = [
	24,
	20,
	16,
	12,
	10,
	8,
	6,
	4,
	3,
	2,
	1,
	1
]


func _ready():
	randomize()


func calculate_line(max: int) -> Array:
	var arr = []
	var arr_w = []
	var values = []
	var s = 0
	for i in range(max):
		s += weights[i]
		arr_w.append(s)
	for i in range(5):
		var rnd = randi() % s
		values.append(rnd)
		for j in range(max):
			if rnd < arr_w[j]:
				arr.append(j + 1)
				break
	return arr
