extends Control

@export var scene:String = "res://Escenas/level_1.tscn"
@onready var progress_bar:ProgressBar = $ProgressBar
var progress = []
var scene_load_status = 0

func _ready():
	ResourceLoader.load_threaded_request(scene)
	
func _process(_delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene,progress)
	progress_bar.value = progress[0]*100
	
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		$continue_button.visible = true
		$Label.visible = false
	else:
		$continue_button.visible = false
		$Label.visible = true

func _on_continue_button_pressed():
	if scene_load_status ==  ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
		queue_free()
	else:
		print("Escena no puede ser cargada")
