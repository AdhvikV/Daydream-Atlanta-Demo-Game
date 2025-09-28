extends Control

func _ready():
	var play_button = get_node("VBoxContainer/Play")
	play_button.pressed.connect(_on_play_pressed)

func _on_play_pressed():
	# Make sure the path matches your scene
	get_tree().change_scene_to_file("res://scenes/tower_1.tscn")
