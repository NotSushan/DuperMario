extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

var max_jumps: int = 1
var jumps_left: int = 0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func jump() -> void:
	velocity.y = JUMP_VELOCITY

func jump_side(x: float) -> void:
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:
	# Double jump becomes active if double_jump_unlocked is true
	if GameManager.double_jump_unlocked:
		max_jumps = 2
	else:
		max_jumps = 1

	# Animations 
	if velocity.x > 1 or velocity.x < -1:
		sprite_2d.animation = "Run"
	else: 
		sprite_2d.animation = "Idle"
		
	# Gravity & Ground Check
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "Jump"
	else:
		jumps_left = max_jumps  # Reset available jumps on ground touch

	# Jump / Double Jump Handling
	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1  # Deduct 1 jump charge

	# Direction & Horizontal Movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 14)

	move_and_slide()
	
	# Horizontal Sprite Flip
	var isLeft = velocity.x < 0 
	sprite_2d.flip_h = isLeft 

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
