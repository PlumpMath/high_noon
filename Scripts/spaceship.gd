extends Area2D

var timer = Timer.new()

func _ready():
	timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(timer)

func _on_spaceship_body_enter( body ):
	if (body.get_name() == "hero"):
		global.dialogue = "You: What is this thing? It feels metal and has a slight buzz coming from it..."

func _on_spaceship_body_exit( body ):
	global.dialogue = ""

func _on_spaceship_area_enter_shape( area_id, area, area_shape, self_shape ):
	timer.set_wait_time(.05)
	get_node("spaceship_sprite").rotate(.05)
	timer.start() #to start
	
func _on_Timer_timeout():
	get_node("spaceship_sprite").rotate(-.05)
	timer.stop() #to start
