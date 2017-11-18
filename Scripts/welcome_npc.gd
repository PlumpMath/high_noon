extends Area2D

var npc_can_leave = false
var velocity = Vector2(-8, 0)

onready var text = get_node("intro_text")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (npc_can_leave):
		translate(velocity)


func _on_welcome_npc_area_enter( area ):
	print("Ouch!")
	text.set_text("Ouch!")

func _on_welcome_npc_body_enter( body ):
	print("body enter")
	intro_text_message(text)

func intro_text_message(node):
	node.set_percent_visible(100)
	node.set_bbcode("Help us!")
	node.newline()
	node.add_text("Something has taken over our town")
	node.newline()
	node.add_text("Take my gun and save us!")

func _on_pickup_guns_body_enter( body ):
	global.has_gun = true
	get_node("pickup_guns").hide()

func _on_npc_exit_body_enter( body ):
	print("Thanks bye!")
	get_node("intro_text").hide()
	get_node("npc_exit").hide()
	npc_can_leave = true

func _on_VisibilityNotifier2D_exit_screen():
	print("Destroying welcome NPC")
	queue_free()
