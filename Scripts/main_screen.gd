extends Control

@onready var video_stream_player = $VideoStreamPlayer

func _ready():		
	
	video_stream_player.play()
	
func _process(_delta):
	if !video_stream_player.is_playing():
		get_tree().change_scene_to_file("res://Escenas/home.tscn")
	


