extends Node

const DEFAULT_MAX_HEALTH = 100
export var PlayerHealth = DEFAULT_MAX_HEALTH
var hero_direction = 1
var enemy_direction = -1
var has_gun = false
var dialogue = ""
var game_over = false
var hero_position = Vector2()

func restart_defaults():
	PlayerHealth = DEFAULT_MAX_HEALTH
	has_gun = false
	dialogue = ""
	game_over = false

func shoot_bullet(spawn_point,fire_directon):
	var bullet = preload("res://bullet_area2d.tscn").instance()
	bullet.set_direction(fire_directon)
	bullet.set_pos(spawn_point)
	get_tree().get_root().add_child(bullet)