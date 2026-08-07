extends Node2D
@export var next_level: PackedScene
@onready var label: Label = $Label

func _ready() -> void:
	get_tree().paused = false
	if label:
		label.text = str(GameManager.points) + " Points Collected"
	else:
		print("Warning: Label node not found in scene tree!")

# Connected to your Next button signal
func _on_next_pressed() -> void:
	GameManager.points = 0
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")	


func _on_play_again_pressed() -> void:
	GameManager.points = 0
	get_tree().change_scene_to_file("res://scenes/level6.tscn")
	
	
