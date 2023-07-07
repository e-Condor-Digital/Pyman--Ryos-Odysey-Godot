extends Node2D

@export var scene:String = "res://Escenas/level_1.tscn"
@onready var progress_bar:ProgressBar = $Progressbar
var progress = []
var bar_status = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request(scene)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bar_status = ResourceLoader.load_threaded_get_status(scene,progress)
	progress_bar.value = progress[0]*10
	if bar_status == ResourceLoader.THREAD_LOAD_LOADED:
		$continue_button.visible = true
	


func _on_button_pressed():
	if bar_status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to(ResourceLoader.load_threaded_get(scene))
		queue_free()
	else:
		print("Error en la carga, reinicie el juego")
