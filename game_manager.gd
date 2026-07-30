extends Node

var points = 0
var total_points = 0

func add_point():
	points += 1
	print("Current Points: ", points)
	
	var root = get_tree().current_scene
	if root:
		var points_label = root.find_child("PointsLabel", true, false)
		if points_label:
			points_label.text = "Points: " + str(points)
