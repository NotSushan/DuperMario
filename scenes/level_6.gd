extends Node

func _ready() -> void:
	GameManager.hearts = $"UI/Hearts".get_children()
	GameManager.double_jump_unlocked = true
