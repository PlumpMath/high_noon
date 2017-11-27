extends Area2D

# Member variables
const BASE_SPEED = 1

var location = Vector2()
var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	location = global.hero_position - get_global_pos()
	velocity.y = location.y / 400

func _fixed_process(delta):
	if (location.x >= 1):
		velocity.x = delta + BASE_SPEED
	elif (location.x <= -1):
		velocity.x = -(delta + BASE_SPEED)
	translate(velocity)

func _on_alien_bullet_area2d_area_enter( area ):
	if(!area.is_in_group("world_trigger") and area.get_name() != "alien_area2d"):
		queue_free()

func _on_alien_bullet_area2d_body_enter( body ):
	if (body.get_name() == "hero"):
		global.PlayerHealth -= 10
#		print("HIT Hero - Health: ", global.PlayerHealth)
	queue_free()
