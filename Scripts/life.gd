extends Area2D
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimatedSprite2D.play("idle")

func _on_body_entered(body):
	if player.player_health <100:
		player.player_health += 15
	else:
		player.player_health += 0
	
	print(player.player_health)
	print(body.get_name())
	queue_free()
