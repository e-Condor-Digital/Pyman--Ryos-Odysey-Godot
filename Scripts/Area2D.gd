extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		print("Has muerto...")
		body.dead()
		body.position.x = -525
		body.position.y = 143
		body.player_health = 0
