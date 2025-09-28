extends Node2D

# Messages in order
@export var messages := [
	"Why did you come? Why did you play?", # Intro
	"Don't follow me!",                    # Intro continues
	"Don't jump on this platform!",       # Obstacle 1
	"Don't finish this!",                 # Obstacle 2
	"Don't cross this next gap!"          # Obstacle 3
]

var current_msg := 0

# Assign obstacles to trigger in order
@export var obstacles: Array = []  # e.g., [Obstacle1, Obstacle2, Obstacle3]

func _ready():
	show_message()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		next_message()

func show_message():
	$Label.text = messages[current_msg]

func next_message():
	# Increment message index
	current_msg += 1
	if current_msg < messages.size():
		show_message()
		_trigger_obstacle_if_needed()
	else:
		$Label.text = ""  # clear text after all messages

func _trigger_obstacle_if_needed():
	# Obstacles start triggering from message 2 onward (index 2+)
	var obstacle_index = current_msg - 2
	if obstacle_index >= 0 and obstacle_index < obstacles.size():
		var obs = obstacles[obstacle_index]
		if obs:
			obs.visible = true
			if obs.has_node("CollisionShape2D"):
				obs.get_node("CollisionShape2D").disabled = false
