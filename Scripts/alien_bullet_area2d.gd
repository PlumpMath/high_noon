extends Area2D

# Member variables
const BASE_SPEED = 1

var velocity = Vector2()
var direction = -1

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (direction == 1):
		velocity.x = delta + BASE_SPEED
	elif (direction == -1):
		velocity.x = -(delta + BASE_SPEED)
	translate(velocity)

func _on_alien_bullet_area2d_area_enter( area ):
	if(!area.is_in_group("world_trigger")):
		queue_free()

func _on_alien_bullet_area2d_body_enter( body ):
	if (body.get_name() == "hero"):
		global.PlayerHealth -= 10
		print("HIT Hero - Health: ", global.PlayerHealth)
	queue_free()
