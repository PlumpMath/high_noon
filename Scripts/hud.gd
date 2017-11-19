extends CanvasLayer

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	get_node("player_health").set_text(str(global.PlayerHealth))
	get_node("dialogue").set_text(global.dialogue)
