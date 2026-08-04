extends Area2D

@export var launch_force: float = -500.0 
@export var pulse_speed: float = 5.0
@export var pulse_amplitude: float = 0.25 # Controls how big it shrinks/stretches

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var original_scale: Vector2

func _ready() -> void:
	original_scale = sprite.scale

func _process(delta: float) -> void:
	# Smooth sine wave pulse for contracting and retracting
	var sine_wave = sin(Time.get_ticks_msec() * 0.001 * pulse_speed)
	var pulse = (sine_wave + 1.0) * 0.5 * pulse_amplitude
	
	# Apply scale change ONLY to the sprite so collisions stay steady
	sprite.scale = original_scale + Vector2(pulse, -pulse)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = launch_force
