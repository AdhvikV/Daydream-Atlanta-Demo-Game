extends Control

@onready var button = $Button  # Your button node

func _ready():
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/tower_1.tscn")
