extends Node2D

var elapsed = 0  # tracks seconds

# Called every second by the timer
func _on_GameTimer_timeout():
	elapsed += 1
	$TimerLabel.text = str(elapsed) + "s"  # update your UI label

func _on_Goal_body_entered(body):
	if body.name == "Player":
		# load Tower_2
		var tower2_scene = preload("res://Tower2.tscn")
		var tower2_instance = tower2_scene.instantiate()
		tower2_instance.final_time = elapsed  # pass the elapsed time
		get_tree().root.add_child(tower2_instance)
		get_tree().current_scene.queue_free()
