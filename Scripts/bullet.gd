extends KinematicBody2D

const MAX_DISTANCE = 500
const SHOT_TIMEOUT = 1
const BASE_SPEED = 10

var startPos = null
var velocity = Vector2()
var direction = global.direction

func _ready():
    set_fixed_process(true)
    startPos = get_global_pos()

func _fixed_process(delta):
	var currentPos = get_global_pos()
	var distance = (currentPos - startPos).length()
	print(direction)
	if (direction == 1):
		velocity.x = delta + BASE_SPEED
	elif (direction == -1):
		velocity.x = -(delta + BASE_SPEED)

	velocity.y = 0

	move(velocity)

	if(distance >= MAX_DISTANCE):
		print("I reached the MAX_DISTANCE")
		queue_free()

	if (is_colliding()):
		print("collision")
		print(get_collider().is_in_group("enemy"))
		queue_free()