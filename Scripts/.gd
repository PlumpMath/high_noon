extends KinematicBody2D

# Constants
const GRAVITY = 400

# Members
var velocity = Vector2()

export var PlayerSpeed = 100

export var Smoothness = 0.1

onready var sprite = get_node("guy")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y += delta * GRAVITY

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
		var normal = get_collision_normal()
		motion = normal.slide(motion)
		velocity = normal.slide(velocity)
		move(motion)
