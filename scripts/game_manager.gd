extends Node

var points: int = 0
var total_points: int = 0

func add_point(amount: int = 1) -> void:
	points += amount
	print("Current Points: ", points)
	update_ui()

func update_ui() -> void:
	var root = get_tree().current_scene
	if root:
		# Check for "PointsLabel", "Label", or "ScoreLabel"
		var points_label = root.find_child("PointsLabel", true, false)
		if not points_label:
			points_label = root.find_child("Label", true, false)
			
		if points_label:
			points_label.text = "Points: " + str(points)
