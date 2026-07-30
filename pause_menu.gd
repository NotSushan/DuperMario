extends CanvasLayer
@onready var panel_2: Panel = $Panel2

func _ready() -> void:
	panel_2.visible = false
	

func _on_button_pressed() -> void:
	panel_2.visible = !panel_2.visible
	get_tree().paused = panel_2.visible
	
	

func _on_resume_pressed() -> void:
	panel_2.visible = false 
	get_tree().paused = false
	
	


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	


func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://first_menu.tscn")
	
