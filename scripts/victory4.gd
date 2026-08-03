extends Node2D

@export var next_level: PackedScene
@onready var label: Label = $Label

func _ready() -> void:
	get_tree().paused = false
	label.text = str(GameManager.points) + " Points Collected"

# Connected to your Next button signal
func _on_next_pressed() -> void:
	GameManager.points = 0
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")	

# Connected to your Play Again button signal
func _on_play_again_pressed() -> void:
	GameManager.points = 0
	get_tree().change_scene_to_file("res://scenes/level4.tscn")
