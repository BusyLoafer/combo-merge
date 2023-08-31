extends Node

var user_file_path = "user://user_data.tres"

var user: UserRes

var default_data = {
	"total_score": 0,
	"bombs": 3,
	"ices": 3,
	"stones":3
}

func _ready() -> void:
	if ResourceLoader.exists(user_file_path):
		var user_data = ResourceLoader.load(user_file_path)
		if user_data is UserRes:
			user = user_data
	else:
		user = UserRes.new()
		user.set_full_data(default_data)
		save_data(user, user_file_path)
	Events.emit_signal("change_data")


func save_data(res: Resource, path: String) -> Error:
	var result := ResourceSaver.save(res, path)
	assert(result == OK)
	return result


func set_total_score(value: int) -> void:
	user.set_total_score(value)
	save_data(user, user_file_path)
	Events.emit_signal("change_data")


func set_bombs(value: int) -> void:
	user.set_bombs(value)


func use_bomb() -> bool:
	return user.use_bomb()


func set_ices(value: int) -> void:
	user.set_ices(value)


func use_ice() -> bool:
	return user.use_ice()


func set_stones(value: int) -> void:
	user.set_stones(value)


func use_stone() -> bool:
	return user.use_stone()
