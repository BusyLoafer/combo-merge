extends Panel

@export var coef := 0.125
@export var radius = 25

var round_scene = preload("res://scenes/round_letters.tscn")


func _ready():
	for i in range(4):
		_create_round(i)
	pass


func _create_round(index: int) -> void:
	var r = round_scene.instantiate()
	$Rounds.add_child(r)
	r.create_letters()
	r.anim_start(index % 2 == 0, index)
		


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass # Replace with function body.
