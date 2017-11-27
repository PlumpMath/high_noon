extends CanvasLayer

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	get_node("player_health").set_text(str(global.PlayerHealth))
	get_node("dialogue").set_text(global.dialogue)
	if (global.game_over or global.PlayerHealth <= 0):
		get_tree().set_pause(true)
		get_node("pause_menu/Popup").show()
		get_node("pause_menu/Popup/Continue").hide()
