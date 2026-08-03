extends Area2D

# MUST be negative to launch upwards in Godot 2D
@export var launch_force: float = -600.0 
@export var pulse_speed: float = 0.01 

var original_scale: Vector2

func _ready() -> void:
	original_scale = scale

func _process(delta: float) -> void:
	# Handles continuous retracting/expanding pulse
	var pulse = (sin(Time.get_ticks_msec() * 0.001 * pulse_speed) + 1.0) * 0.2
	scale = original_scale + Vector2(pulse, pulse)

func _on_body_entered(body: Node2D) -> void:
	# Forces velocity change on any CharacterBody2D
	if body is CharacterBody2D:
		body.velocity.y = launch_force
