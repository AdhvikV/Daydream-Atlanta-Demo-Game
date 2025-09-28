extends Control

@export var level_scene = "res://scenes/Level1.tscn"
@export var main_menu_scene = "res://scenes/MainMenu.tscn"

func _ready():
	visible = false

func show_lose_screen():
	visible = true
	get_tree().paused = true

func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene(level_scene)

func _on_MainMenuButton_pressed():
	get_tree().paused = false
	get_tree().change_scene(main_menu_scene)
