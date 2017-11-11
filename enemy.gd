extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (is_colliding()):
			print("collision")
			print(get_collider())
#			queue_free()
