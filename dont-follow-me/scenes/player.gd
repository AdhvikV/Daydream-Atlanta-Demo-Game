extends CharacterBody2D

@export var speed := 200.0
@export var jump_force := 450.0
@export var gravity := 1200.0

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump_force

	# Horizontal movement
	var dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = dir * speed

	# Flip sprite
	if dir != 0:
		$Sprite2D.flip_h = dir > 0

	move_and_slide()
