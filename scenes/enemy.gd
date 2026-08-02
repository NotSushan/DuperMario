extends RigidBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 30):
			print("destroy enemy")
			queue_free()
			body.jump()
		else:
			print("decrease health")
			GameManager.decrease_health()
		if (x_delta > 0):
			body.jump_side(500)
		else:
			body.jump_side(-500)
