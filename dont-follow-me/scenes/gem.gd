extends Node2D  # or Area2D if you want collisions

# Optional: make the gem fall slowly when dropped
@export var fall_speed: float = 0  # set >0 if you want it to drop

func _process(delta):
	if fall_speed > 0:
		position.y += fall_speed * delta

# Optional: detect if player touches it to pick up again
func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()  # remove the gem from scene when collected
