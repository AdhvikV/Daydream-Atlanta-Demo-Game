extends Area2D

@export var next_scene_path: String = "res://scenes/Tower2.tscn"

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(next_scene_path)
