extends ParallaxBackground

@onready var mc_1 = $Jugador/Player2
@onready var dragon = $Dragon/dragon
@onready var dragon2 = $Dragon2/dragon2
@onready var dragon_3 = $Dragon3/dragon2

var time_load = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_base_offset.x -= 30*delta
	dragon.play("Move")
	dragon2.play("Move")
	dragon_3.play("Move")
	mc_1.play("Run")


func _on_start_2_pressed():
	get_tree().change_scene_to_file("res://Escenas/load_scene.tscn")
