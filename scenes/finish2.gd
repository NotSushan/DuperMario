extends Area2D

@export var total_points : int = 14  # Default is 14

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		GameManager.total_points = total_points  # Pass whatever value is set in Inspector
		get_tree().change_scene_to_file("res://scenes/victory_2.tscn")
