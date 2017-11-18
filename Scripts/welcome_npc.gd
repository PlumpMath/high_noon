extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var text = get_node("intro_text")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


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