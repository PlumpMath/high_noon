extends Node

const DEFAULT_MAX_HEALTH = 100
const PLAYER = 0
const ENEMY_HUMAN = 1
const ENEMY_ALIEN = 2

export var PlayerHealth = DEFAULT_MAX_HEALTH
var hero_direction = 1
var enemy_direction = -1
var has_gun = false
var dialogue = ""
var game_over = false
var hero_position = Vector2()
var alien_bullet_scale = Vector2(2,2)

func restart_defaults():
	PlayerHealth = DEFAULT_MAX_HEALTH
	has_gun = false
	dialogue = ""
	game_over = false

func shoot_bullet(spawn_point,enemy_type):
	var bullet = preload("res://bullet_area2d.tscn").instance()
	bullet.set_enemy(enemy_type)
	if (enemy_type == ENEMY_ALIEN):
		bullet.set_scale(alien_bullet_scale)
	bullet.set_pos(spawn_point)
	get_tree().get_root().add_child(bullet)