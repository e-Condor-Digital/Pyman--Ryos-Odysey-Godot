extends Area2D

func _ready():
	$AnimationPlayer.play("fantasma_move")

func _on_body_entered(body):
	if body.name == "Player":
		if body.player_health < 0:
			$AnimatedSprite2D.play("dead")
			body.dead()
			body.position.x = -525
			body.position.y = 143
		else:
			body.player_health -= 25
			print(body.player_health)
