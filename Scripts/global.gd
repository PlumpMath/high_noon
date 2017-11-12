extends Node

# class member variables go here, for example:
var hero_direction = 1
var enemy_direction = -1

func shoot_bullet(spawn_point,fire_directon):
	var bullet = preload("res://bullet_area2d.tscn").instance()
	bullet.set_direction(fire_directon)
	bullet.set_pos(spawn_point)
	get_tree().get_root().add_child(bullet)