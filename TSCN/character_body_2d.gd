extends Node2D

# Speed of the enemy
var speed: float = 100.0

# Reference to the PathFollow2D node
onready var path_follow: PathFollow2D = $Path2D/PathFollow2D

func _ready():
	# Set the initial position of the enemy to the start of the path
	path_follow.offset = 0

func _process(delta: float):
	# Move along the path
	path_follow.offset += speed * delta
	# Update the enemy's position
	position = path_follow.position

	# Optional: Reset the enemy's position if it goes past the end of the path
	if path_follow.offset > path_follow.path_length:
		queue_free()  # Remove the enemy or handle it appropriately