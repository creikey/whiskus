extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# y = sin (x / 60) * 200
# 60 is amplitude, 200 is cycle length

export var dune_color = Color()
export var resolution = 5
export var dune_height_range = [200.0, 400.0]
export var dune_length_range = [0.0, 1000.0]
export var dune_cycle_range = [ 150.0, 300.0 ]

var dunelines = PoolVector2Array()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	# randomize()
	pass

func _draw():
	randomize()
	var cur = dune_length_range[0]
	var curcur=0
	var cur_dune_amplitude
	var cur_dune_cycle
	# dunelines.append(Vector2(0,0))
	# dunelines.append(Vector2(150,150))
	# dunelines.append(Vector2(150,0))
	# draw_polygon(dunelines, PoolColorArray([dune_color]) )
	# print( "Drawing dunes at ", dunelines)
	# draw_circle(Vector2(150,150), 100, Color(1,0,0))
	
	dunelines.append(Vector2(0,dune_height_range[1]))
	
	while(cur < dune_length_range[1]):
		cur_dune_amplitude = rand_range(dune_height_range[0], dune_height_range[1])
		cur_dune_cycle = rand_range(dune_cycle_range[0], dune_cycle_range[1])
		curcur=0
		while(curcur < cur_dune_cycle*2*PI):
			var to_append = Vector2(cur, sin(cur/(cur_dune_cycle/PI)) * cur_dune_amplitude)
			dunelines.append(to_append)
			# print(to_append)
			cur += resolution
			curcur += resolution
	
	dunelines.append(Vector2(cur,dune_height_range[1]))
	
	# print( "Drawing dunes at ", dunelines)
	draw_polygon(dunelines, PoolColorArray([dune_color]) )
	
	# draw_polyline(dunelines, dune_color, 2)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
