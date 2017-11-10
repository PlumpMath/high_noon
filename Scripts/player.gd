extends KinematicBody2D

# Constants
const GRAVITY = 400
const JUMP_STRENTH = 300
const MAX_JUMP_COUNT = 1

# Members
var velocity = Vector2()
var jump_allowed_timer = 0
var jump_count = 0
var on_ground = 0

export var PlayerSpeed = 100
export var Smoothness = 0.1

onready var sprite = get_node("guy")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	if jump_count < MAX_JUMP_COUNT and event.is_action_pressed("jump"):
		velocity.y = -JUMP_STRENTH
		jump_count += 1

func _fixed_process(delta):
	velocity.y += delta * GRAVITY
	
	if (jump_allowed_timer > 0):
		jump_allowed_timer -= delta

	var direction = 0
	if (Input.is_action_pressed("move_left")):
		direction = -1
		sprite.set_flip_h(true)
	elif (Input.is_action_pressed("move_right")):
		direction = 1
		sprite.set_flip_h(false)

	velocity.x = lerp(velocity.x, PlayerSpeed * direction, Smoothness)

	var motion = velocity * delta
	move(motion)

	# Are we on the ground
	if (is_colliding()):
		on_ground = 1
		var normal = get_collision_normal()
		print(normal)
		motion = normal.slide(motion)
		velocity = normal.slide(velocity)
		move(motion)

		if (normal == Vector2(0,-1)):
			jump_count = 0
