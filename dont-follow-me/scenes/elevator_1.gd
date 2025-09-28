extends StaticBody2D

@export var speed := 100.0
@export var min_y := 440
@export var max_y := 590
var going_up := true

func _process(delta):
	if going_up:
		position.y -= speed * delta
		if position.y <= min_y:
			going_up = false
	else:
		position.y += speed * delta
		if position.y >= max_y:
			going_up = true
