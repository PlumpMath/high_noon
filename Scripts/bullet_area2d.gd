extends Area2D

# Member variables
const BASE_SPEED = 10

var velocity = Vector2()
var direction = global.direction

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (direction == 1):
		velocity.x = delta + BASE_SPEED
	elif (direction == -1):
		velocity.x = -(delta + BASE_SPEED)
	translate(velocity)


func _on_bullet_area2d_area_enter( area ):
#	print("bullet_area_enter")
	queue_free()


func _on_bullet_area2d_body_enter( body ):
#	print("bullet_body_enter")
	queue_free()

