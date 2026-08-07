extends Area2D

@export var rotation_speed: float = 10.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	if sprite.sprite_frames and sprite.sprite_frames.has_animation("default"):
		sprite.play("default")

func _process(delta: float) -> void:
	sprite.rotation += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	# Check specifically for your player character
	if body.is_in_group("player") or body.name == "CharacterBody2D":
		# Safely reload scene on the next frame to prevent physics crashes
		get_tree().call_deferred("reload_current_scene")
