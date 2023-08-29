extends Node2D


func create_letters() -> void:
	randomize()
	var step = 360.0 / 16
	for i in range(16):
		var letter = Node2D.new()
		letter.rotation_degrees = step * i
		$Letters.add_child(letter)
		var sprite = Sprite2D.new()
		sprite.texture = Images.nums[str(randi() % 12 + 1)]
		sprite.position = Vector2(0, 200)
		sprite.rotation_degrees = -8
		letter.add_child(sprite)
	pass


func anim_start(forward = true, seek = 0) -> void:
	if forward:
		$AnimationPlayer.play("Rotate")
	else:
		$AnimationPlayer.play("Rotate_back")
	if seek != 0:
		$AnimationPlayer.seek(5.0 / 4 * (seek))
	pass
