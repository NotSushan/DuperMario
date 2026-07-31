extends Control

func _ready() -> void:
	get_tree().paused = false
	# Explicitly grab nodes by exact string path to prevent null errors
	if has_node("Options"):
		$Options.hide()
	if has_node("MainButtons"):
		$MainButtons.show()

# Connected to "Start Game" button
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

# Connected to "Options" button
func _on_button_2_pressed() -> void:
	if has_node("MainButtons") and has_node("Options"):
		$MainButtons.hide()
		$Options.show()

# Connected to "Exit" button
func _on_button_3_pressed() -> void:
	get_tree().quit()

# Connected to "Back" button inside Options
func _on_back_pressed() -> void:
	if has_node("MainButtons") and has_node("Options"):
		$Options.hide()
		$MainButtons.show()
