extends Camera2D
@onready var player = $".."

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	global_position.x = player.global_position.x
