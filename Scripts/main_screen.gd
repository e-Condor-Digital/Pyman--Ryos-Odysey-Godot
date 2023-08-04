extends Control

@export var scene:String = "res://Escenas/home.tscn"
@onready var progress_bar:ProgressBar = $ProgressBar
var progress = []
var scene_load_status = 0
var scene_max_time = 10000

func _ready():
	ResourceLoader.load_threaded_request(scene)
	
func _process(_delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene,progress)
	progress_bar.value = progress[0]*10000
	
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		#$empezar_button.visible = true
		$logo.visible = false
		$ColorRect.visible = false
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
		queue_free()
		pass
	else:
		$logo.visible = true
		$ColorRect.visible = true
		#$empezar_button.visible = false

'''func _on_empezar_button_pressed():
	if scene_load_status ==  ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
		queue_free()
		pass
	else:
		print("Escena no puede ser cargada")'''
