extends ColorRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (PackedScene) var stars
var hour
var bg_color

func _ready():
	randomize()
	# Called every time the node is added to the scene.
	# Initialization here
	hour = OS.get_datetime()["hour"]
	print("Current hour is: ", hour)
	# Nighttime
	if hour > 18:
		#var cur_stars = stars.instance()
		#add_child(cur_stars)
		make_stars()
		bg_color=Color(30.0/255,43.0/255,88.0/255)
	# Midday
	elif hour > 10 :
		bg_color=Colors(226.0/255,215.0/255,127.0/255)
	# Early morning
	else:
		#var cur_stars = stars.instance()
		#add_child(cur_stars)
		make_stars()
		bg_color=Color(35.0/255,11.0/255,67.0/255)
	print("Color is: ", bg_color)
	set_frame_color(bg_color)

func make_stars():
	var cur_stars = stars.instance()
	cur_stars.star_size = 2.0
	cur_stars.star_y_mask = 800
	cur_stars.star_frequency = 0.03
	cur_stars.star_randomness = 10.0
	cur_stars.star_color = Color(0.8,0.8,0.8)
	add_child(cur_stars)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
