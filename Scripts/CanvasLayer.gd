extends CanvasLayer
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time
func _ready():
	get_node("ProgressBar").max_value = player.player_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_instance_valid(player):
		get_node("ProgressBar").max_value = player.player_health

func _on_progress_bar_value_changed(value):
	if value <= 0:
		get_node("AnimationPlayer").play("Fade_out")

