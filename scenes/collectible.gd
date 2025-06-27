extends Area2D

func _ready():
	pass

func _on_body_entered(body):
	if body.name == "player":  
		$AudioStreamPlayer.play()
		await get_tree().create_timer(0.2).timeout
		queue_free()
