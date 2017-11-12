extends Area2D

const MAX_DAMAGE = 100
var current_damage = 0

func _ready():
	set_process(true)

#check if we have been hit and do damange
func _on_enemy_area2d_area_enter( area ):
	current_damage += 20
	print("Enemy health %d" % (MAX_DAMAGE - current_damage))
	get_node("blood_particle").set_emitting(true)
	if (current_damage >= MAX_DAMAGE):
		print("Enemy health %d" % current_damage)
		queue_free()

func _on_enemy_area2d_body_enter( body ):
	print("Enemy_hit_body_enter")
