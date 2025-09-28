extends Control

@onready var button = $Button  # Make sure this matches your node name

func _ready():
	button.pressed.connect(_on_button_pressed)
	$FinalTimeLabel.text = "Time: " + str(final_time) + "s"

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/tower_1.tscn")



var elapsed = 0  # tracks seconds

# Called every second by the timer
func _on_GameTimer_timeout():
	elapsed += 1
	$TimerLabel.text = str(elapsed) + "s"  # update your UI label

var final_time = 0  # will receive from Tower_1
