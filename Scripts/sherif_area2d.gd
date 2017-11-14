extends Area2D

const MAX_DAMAGE = 100
const SHOT_TIMEOUT = 100

var current_damage = 0
var current_shot_timer = SHOT_TIMEOUT

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (current_shot_timer > 1):
		current_shot_timer -= (delta * 100)
	else:
#		global.shoot_bullet(get_node("Position2D").get_global_pos(), -1)
		current_shot_timer = SHOT_TIMEOUT

#check if we have been hit and do damange
func _on_enemy_area2d_area_enter( area ):
	current_damage += 20
	print("Enemy health %d" % (MAX_DAMAGE - current_damage))
	get_node("blood_particle").set_emitting(true)
	if (current_damage >= MAX_DAMAGE):
		queue_free()

func _on_enemy_area2d_body_enter( body ):
	print("Enemy_hit_body_enter")
