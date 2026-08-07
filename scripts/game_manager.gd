extends Node

# Progression & Unlocks
var unlocked_level: int = 1
var double_jump_unlocked: bool = false

# Player Stats
var points: int = 0
var total_points: int = 0
var lives: int = 3
var hearts: Array[Node] = []
var can_take_damage: bool = true

func unlock_next_level(current_level: int) -> void:
	if current_level >= unlocked_level:
		unlocked_level = current_level + 1

func decrease_health() -> void:
	if not can_take_damage:
		return
	can_take_damage = false

	lives -= 1
	print("Lives remaining: ", lives)
	
	for h in range(hearts.size()):
		if h < lives:
			hearts[h].show()
		else:
			hearts[h].hide()

	if lives <= 0:
		reset_stats()
		get_tree().reload_current_scene()
		return

	await get_tree().create_timer(1.0).timeout
	can_take_damage = true

func reset_stats() -> void:
	lives = 3
	can_take_damage = true

func add_point(amount: int = 1) -> void:
	points += amount
	print("Current Points: ", points)
	update_ui()

func update_ui() -> void:
	var root = get_tree().current_scene
	if root:
		var points_label = root.find_child("PointsLabel", true, false)
		if not points_label:
			points_label = root.find_child("Label", true, false)
	
		if points_label:
			points_label.text = "Points: " + str(points)
