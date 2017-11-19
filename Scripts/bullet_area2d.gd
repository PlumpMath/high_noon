extends Area2D

# Member variables
const BASE_SPEED = 10

var velocity = Vector2()
var direction = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (direction == 1):
		velocity.x = delta + BASE_SPEED
	elif (direction == -1):
		velocity.x = -(delta + BASE_SPEED)
	translate(velocity)

func set_direction(desired_direction):
	direction = desired_direction

func _on_bullet_area2d_area_enter( area ):
	queue_free()

func _on_bullet_area2d_body_enter( body ):
	if (body.get_name() == "hero"):
		global.PlayerHealth -= 10
		print("HIT Hero - Health: ", global.PlayerHealth)
	queue_free()

func _on_VisibilityEnabler2D_exit_screen():
	queue_free()
