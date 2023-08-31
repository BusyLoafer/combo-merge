extends Control

@export_node_path("Label") var total_score_path




func _ready():
	Events.connect("change_data", _change_data)
	_change_data()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _change_data() -> void:
	if !total_score_path:
		printerr("total_score_path not found")
		return
	get_node(total_score_path).text = str(Data.user.total_score)
