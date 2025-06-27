extends RigidBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var y_delta = position.y - body.position.y

		if y_delta > 30:
			print("Destroy enemy")
			if body.has_method("jump"):
				body.jump()
			call_deferred("queue_free")  
		else:
			print("Game Over")
			await get_tree().create_timer(0.1).timeout  
			get_tree().change_scene_to_file("res://scenes/gameover.tscn")
