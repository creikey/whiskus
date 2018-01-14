extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var star_size = 2.0
var star_y_mask = 800
var star_frequency = 0.03
var star_randomness = 10.0
var star_color = Color(0.8,0.8,0.8)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _draw():
	var i = 0.0
	var ii = 0.0
	while i < OS.get_window_size().x:
		while ii < OS.get_window_size().y-star_y_mask:
			if rand_range(0.0, 1) < star_frequency:
				# print("Drawing circle at ", Vector2(i,ii))
				draw_circle(Vector2(i+rand_range(-star_randomness,star_randomness),ii+rand_range(-star_randomness,star_randomness)),star_size,star_color)
			ii += star_size*2
		ii=0
		# print("Iterating through x")
		i += star_size*2

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
