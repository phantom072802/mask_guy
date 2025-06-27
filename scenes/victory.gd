extends Node

@onready var audio_player = $AudioStreamPlayer

func _ready() -> void:
	audio_player.play()

func _on_back_to_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")
