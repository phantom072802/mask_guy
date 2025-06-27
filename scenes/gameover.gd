extends Node

@onready var audio_player = $AudioStreamPlayer

func _ready():
	audio_player.play()

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")
