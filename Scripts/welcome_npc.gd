extends Area2D

var npc_can_leave = false
var velocity = Vector2(-8, 0)

onready var text = get_node("ouch")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (npc_can_leave):
		translate(velocity)

func _on_welcome_npc_area_enter( area ):
	print("Ouch!")
	text.set_percent_visible(100)

func _on_npc_enter_body_enter( body ):
	global.dialogue = "Local: Help us! Something has taken over our town. Take my guns and save us!"

func _on_pickup_guns_body_enter( body ):
	global.has_gun = true
	get_node("pickup_guns").hide()

func _on_npc_exit_body_enter( body ):
	print("Thanks bye!")
	text.hide()
	get_node("npc_enter").hide()
	get_node("npc_exit").hide()
	global.dialogue = "Local: Bye!"
	npc_can_leave = true

func _on_VisibilityNotifier2D_exit_screen():
	if (global.has_gun):
		print("Destroying welcome NPC")
		global.dialogue = ""
		queue_free()
