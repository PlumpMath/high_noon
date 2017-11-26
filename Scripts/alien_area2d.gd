extends Area2D

const MAX_DAMAGE = 100
const SHOT_TIMEOUT = 100

var current_damage = 0
var can_shoot = false
var current_shot_timer = SHOT_TIMEOUT
var bullet_scale = Vector2(.5,.5)

func _ready():
	randomize()
	set_fixed_process(true)

func _fixed_process(delta):
	if (can_shoot):
		if (current_shot_timer > 1):
			current_shot_timer -= (delta * 100)
		else:
			var bullet = preload("res://alien_bullet_area2d.tscn").instance()
			bullet.set_scale(bullet_scale)
			bullet.set_pos(get_node("Position2D").get_pos())
			add_child(bullet)
			current_shot_timer = rand_range(70, 140)

#check if we have been hit and do damange
func _on_alien_area2d_area_enter( area ):
	current_damage += 20
	print("Alien health %d" % (MAX_DAMAGE - current_damage))
#	get_node("blood_particle").set_emitting(true)
	if (current_damage >= MAX_DAMAGE):
		queue_free()

func _on_alien_area2d_body_enter( body ):
	print("Alien_hit_body_enter")

func _on_VisibilityNotifier2D_enter_screen():
	print("Alien_enters_screen")
	can_shoot = true