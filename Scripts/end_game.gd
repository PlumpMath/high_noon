extends Area2D

func _ready():
	pass

func _on_end_game_body_enter( body ):
	if (body.get_name() == "hero"):
		global.game_over = true
