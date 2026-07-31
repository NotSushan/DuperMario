extends Area2D

@export var point_value: int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D" or body.is_in_group("Player") or body is CharacterBody2D:
		if is_instance_valid(GameManager):
			GameManager.add_point(point_value)
		queue_free()
		
