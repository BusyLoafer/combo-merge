extends Resource
class_name UserRes

@export var total_score: int
@export var bombs: int
@export var ices: int
@export var stones: int
var points := 0


func set_full_data(data: Dictionary) -> void:
	total_score = data["total_score"]
	bombs = data["bombs"]
	ices = data["ices"]
	stones = data["stones"]


func set_total_score(value: int) -> void:
	total_score = value


func set_bombs(value: int) -> void:
	bombs = value


func use_bomb() -> bool:
	if bombs > 0:
		bombs -= 1
		return true
	return false


func set_ices(value: int) -> void:
	ices = value


func use_ice() -> bool:
	if ices > 0:
		ices -= 1
		return true
	return false


func set_stones(value: int) -> void:
	stones = value


func use_stone() -> bool:
	if stones > 0:
		stones -= 1
		return true
	return false


