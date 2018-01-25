extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar

#export var planet_radius = 30.0
#export var planet_color = Color()
var planet_radius = 30.0
var planet_color = Color()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _draw():
	draw_circle(Vector2(), planet_radius, planet_color)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
