extends CanvasLayer

@onready var audio_player = $AudioStreamPlayer

func _ready():
	$Button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	audio_player.stop()
	get_tree().change_scene_to_file("res://player_scene.tscn")
