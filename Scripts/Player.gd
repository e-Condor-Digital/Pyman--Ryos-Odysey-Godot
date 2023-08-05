extends CharacterBody2D

@onready var player = $AnimatedSprite2D

var speed := 120
var direction := 0.0
var jump := 275
const gravity := 9.8


func _physics_process(_delta):
	direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	
	if direction != 0:
		player.play("run")
	else:
		player.play("Idle")
		
			
	player.flip_h = direction < 0 if direction != 0 else player.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		player.play("jump_fall")
		velocity.y -= jump
	
	if !is_on_floor():
		player.play("jump_fall")
		velocity.y += gravity

	move_and_slide()
