extends CharacterBody2D

@onready var color_rect = $"../ColorRect"
@onready var label = $"../Label"
@onready var button = $"../Button"
@onready var fantasma = $"../Enemies/Fantasma"
@onready var canvas_layer = $"../CanvasLayer"

var velocidad = 225
var gravedad = 225
var salto = 255

var player_health = 100

func _ready():
	label.visible = false
	color_rect.visible = false
	button.visible = false
	pass
	
func _physics_process(delta):
	
	velocity.y += gravedad*delta
	
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = false
		
		velocity.x = velocidad
	elif  Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.flip_h = true
		
		$AnimatedSprite2D.play("run")
		velocity.x = -velocidad
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = 0
		
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			$AnimatedSprite2D.play("jump")
			velocity.y = -salto
		else:
			if Input.is_action_just_released("jump"):
				$AnimatedSprite2D.play("fall")
				velocity.y += gravedad
				
	move_and_slide()
	
func dead():
	set_physics_process(false)
	$AnimatedSprite2D.play("dead")
	color_rect.visible = true
	label.visible = true
	button.visible = true
	fantasma.visible = false
	canvas_layer.visible = false
	queue_free()
	
	
		
