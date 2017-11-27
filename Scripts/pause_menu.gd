extends CanvasLayer

var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()

func _ready():
	set_process_input(true)

func _input(event):
	if (event.is_action_pressed("pause")):
		OS.set_window_position(screen_size*0.5 - window_size*0.5)
		get_node("Popup").show()
		get_tree().set_pause(true)
		
func _on_Continue_pressed():
	get_tree().set_pause(false)
	get_node("Popup").hide()

func _on_Restart_pressed():
	get_tree().change_scene("res://high_noon.tscn")
	global.restart_defaults()
	get_tree().set_pause(false)

func _on_Quit_pressed():
	get_tree().quit()
