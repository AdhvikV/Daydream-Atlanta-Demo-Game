extends Area2D

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name == "player":
		print("Player touched lava!")
		get_tree().change_scene("res://scenes/LoseScreen.tscn")
