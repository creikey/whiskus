extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#export var outline_color = Color()
#export var resolution = 5.0
#export var thickness = 1.0

var outline_color = Color()
var resolution = 5.0
var thickness = 1.0
var anti_alias = false
var segment_length = 10.0
var segments_off = 1
var segments_on = 1

var radius = 50.0
var circumference = 2*PI*radius
var real_step = (resolution/circumference)*(2*PI)
var real_segments_length = (segment_length/circumference)*(2*PI)
# var real_segments_length = segment_length

func _init():
	set_visible(false)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _draw():
	#var rasterized = PoolVector2Array()
	#var cur = 0.0
	#var drawing_segment=true
	#while( abs(cur) < circumference ):
	#	if(drawing_segment):
	#		rasterized.append(Vector2(sin(cur)*radius, cos(cur)*radius))
	#		cur -= real_step
	#		rasterized.append(Vector2(sin(cur)*radius, cos(cur)*radius))
	#		drawing_segment = false
	#	cur -= real_step
	#	cur -= real_step
	#	cur -= real_step
	#	cur -= real_step
	#	drawing_segment=true
		#if(fmod(fmod(cur, segment_length), real_percent_on) == real_percent_on-1):
		#	rasterized.append(Vector2(sin(cur)*radius, cos(cur)*radius))
		#cur -= real_step
	# draw_polyline(rasterized, outline_color, thickness, anti_alias)
	# draw_polygon(rasterized, [Color()])
	var cur = 0.0
	var cur_segments
	while( cur < circumference ):
		# print(floor(cur/real_segments_length))
		cur_segments = floor(cur/real_segments_length)
		while(1):
			draw_line(Vector2(sin(cur)*radius, cos(cur)*radius), Vector2(sin(cur+real_step)*radius, cos(cur+real_step)*radius), outline_color )
			cur += real_step
			if( floor(cur/real_segments_length) - cur_segments >= segments_on ):
				break;
		cur_segments = floor(cur/real_segments_length)
		while(1):
			# draw_line(Vector2(sin(cur)*radius, cos(cur)*radius), Vector2(sin(cur+real_step)*radius, cos(cur+real_step)*radius), outline_color )
			cur += real_step
			print(floor(cur/real_segments_length) - cur_segments)
			print(segments_off)
			if( floor(cur/real_segments_length) - cur_segments >= segments_off ):
				break;

func set_radius(inr):
	radius = inr 

func get_radius():
	return radius

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
