extends Area2D

var enemy = preload("res://enemy_area2d.tscn").instance()

func _on_npc_enter_body_enter( body ):
	if (body.get_name() == "hero"):
		global.dialogue = "Gang Member: That object belongs to (cheesy gang name). We kill anyone that has seen it."


func _on_npc_attack_body_enter( body ):
	if (body.get_name() == "hero"):
		global.dialogue = ""
		enemy.set_pos(get_node("Position2D").get_pos())
		add_child(enemy)
		get_node("empty_enemy").hide()
		get_node("npc_enter").queue_free()
		get_node("npc_attack").queue_free()
