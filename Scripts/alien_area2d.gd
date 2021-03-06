extends Area2D

const MAX_DAMAGE = 100
const SHOT_TIMEOUT = 100

var current_damage = 0
var can_shoot = false
var current_shot_timer = SHOT_TIMEOUT

func _ready():
	randomize()
	set_fixed_process(true)

func _fixed_process(delta):
	if (can_shoot):
		if (current_shot_timer > 1):
			current_shot_timer -= (delta * 100)
		else:
			global.shoot_bullet(get_node("Position2D").get_global_pos(), global.ENEMY_ALIEN)
			current_shot_timer = rand_range(70, 140)

#check if we have been hit and do damange
func _on_alien_area2d_area_enter( area ):
	if (area.get_name() != "alien_bullet_area2d"):
		current_damage += 20
#		print("Alien health %d" % (MAX_DAMAGE - current_damage))
#		get_node("blood_particle").set_emitting(true)
		if (current_damage >= MAX_DAMAGE):
			queue_free()

func _on_alien_area2d_body_enter( body ):
	print("Alien_hit_body_enter")

func _on_VisibilityNotifier2D_enter_screen():
	print("Alien_enters_screen")
	can_shoot = true