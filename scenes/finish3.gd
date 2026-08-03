extends Area2D

@export var total_points : int = 14  # Default is 14

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		GameManager.total_points = total_points  # Pass whatev...
		get_tree().change_scene_to_file.call_deferred("res://scenes/victory_3.tscn")
		
