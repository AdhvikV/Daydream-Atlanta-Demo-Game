extends CharacterBody2D

# --- Movement ---
@export var max_speed: float = 200
@export var min_speed: float = 50
@export var jump_velocity: float = -350
@export var gravity: float = 900

# --- Inventory ---
var gems: int = 3
var max_gems: int = 3

# --- UI ---
@onready var gem_label = $CanvasLayer/GemLabel

# --- Sprite ---
@onready var sprite = $Sprite2D

# --- Gem scene ---
@export var gem_scene = preload("res://scenes/Gem.tscn")

# --- Physics process ---
func _physics_process(delta: float) -> void:
	# Horizontal movement
	var direction: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * get_speed()
	
	# Flip sprite
	if direction < 0:
		sprite.flip_h = false
	elif direction > 0:
		sprite.flip_h = true

	# Gravity and jump
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = jump_velocity
	
	# Move the player
	move_and_slide()

	# Drop gem with E
	if Input.is_action_just_pressed("drop_gem") and gems > 0:
		drop_gem()

# --- Speed based on gems ---
func get_speed() -> float:
	var penalty: float = gems * 0.2
	var speed: float = max_speed * (1.0 - penalty)
	return max(speed, min_speed)

# --- Drop gem ---
func drop_gem(count: int = 1) -> void:
	gems -= count
	if gems < 0:
		gems = 0
	update_ui()
	
	for i in range(count):
		var gem_instance = gem_scene.instantiate()
		get_tree().current_scene.add_child(gem_instance)
		gem_instance.global_position = global_position

# --- Update UI ---
func update_ui() -> void:
	if gem_label:
		gem_label.text = "Gems: %d / %d" % [gems, max_gems]
