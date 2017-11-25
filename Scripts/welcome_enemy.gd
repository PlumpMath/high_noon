extends Area2D

#func _ready():
#	set_fixed_process(true)
#	pass

#func _fixed_process(delta):

func _on_npc_enter_body_enter( body ):
	if (body.get_name() == "hero"):
		global.dialogue = "Gang Member: That object belongs to (cheesy gang name). We kill anyone that has seen it."


func _on_npc_attack_body_enter( body ):
	if (body.get_name() == "hero"):
		global.dialogue = ""
		var enemy = preload("res://enemy_area2d.tscn").instance()
		enemy.set_pos(get_node("Position2D").get_pos())
		add_child(enemy)
		
