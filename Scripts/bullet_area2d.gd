extends Area2D

# Member variables
const BASE_SPEED_ALIEN = 2
const BASE_SPEED_HUMAN = 10

var SPEED = 1
var is_player = false
var player_direction_local = 0
var shooter = -1
var location = Vector2()
var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	location = global.hero_position - get_global_pos()
	velocity.y = location.y / 400

func _fixed_process(delta):
	if (is_player):
		if (player_direction_local == 1):
			location.x = delta + SPEED
		elif (player_direction_local == -1):
			location.x = -(delta + SPEED)
		location.y = 0
		translate(location)
	else:
		if (location.x >= 1):
			velocity.x = delta + SPEED
		elif (location.x <= -1):
			velocity.x = -(delta + SPEED)
		# lock human to only firing left due to limitation in sprite/gun position
		if (shooter == global.ENEMY_HUMAN):
			velocity.x = -(delta + SPEED)
		translate(velocity)

func set_enemy(enemy_type):
	shooter = enemy_type
	if (shooter == global.PLAYER):
		is_player = true
		SPEED = BASE_SPEED_HUMAN
		player_direction_local = global.hero_direction
		get_node("Sprite").set_texture(load("res://Textures/bullet.png"))
	elif (shooter == global.ENEMY_HUMAN):
		SPEED = BASE_SPEED_HUMAN
		get_node("Sprite").set_texture(load("res://Textures/bullet.png"))
	elif (shooter == global.ENEMY_ALIEN):
		SPEED = BASE_SPEED_ALIEN

func _on_alien_bullet_area2d_area_enter( area ):
	if(!area.is_in_group("world_trigger")):
		queue_free()
		return
	if (area.get_name() == "alien_area2d" and shooter == global.PLAYER):
		queue_free()
		return

func _on_alien_bullet_area2d_body_enter( body ):
	if (body.get_name() == "hero"):
		global.PlayerHealth -= 10
#		print("HIT Hero - Health: ", global.PlayerHealth)
	queue_free()


func _on_VisibilityEnabler2D_exit_screen():
	queue_free()