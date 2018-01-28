extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# export var rotate_point = Vector2()
export var rotate_radius = 100.0
export var rotate_step = 1.0
export var draw_line = false
# Drawing the orbitor
export var planet_radius = 30.0
export var planet_color = Color()
# Drawing the dotted line
export var dotted_outline_color = Color()
export var dotted_outline_resolution = 5.0
export var dots_thickness = 1.0
export var anti_alias = false
export var segments_length = 10.0
export var segments_on = 1
export var segments_off = 1

var rotate_point = Vector2()
var orbit_circumference = 2*PI*rotate_radius
var orbit_step_max = orbit_circumference/rotate_step
var cur = 0.0

onready var orbit_path = get_parent()
onready var orbit_draw = get_node("draw_orbitor")

func _ready():
	# The outline
	orbit_path.outline_color = dotted_outline_color
	orbit_path.resolution = dotted_outline_resolution
	orbit_path.thickness = dots_thickness
	orbit_path.anti_alias = anti_alias
	orbit_path.segment_length = segments_length
	orbit_path.segments_on = segments_on
	orbit_path.segments_off = segments_off
	orbit_path.radius = rotate_radius
	#The planet
	orbit_draw.planet_radius = planet_radius
	orbit_draw.planet_color = planet_color
	if(draw_line):
		orbit_path.set_visible(true)
		orbit_path.update()
	rotate_point=get_position()
	set_physics_process(true)
	
func _physics_process(delta):
	cur += rotate_step
	cur = fmod(cur, orbit_step_max)
	move_to_orbit( cur, orbit_step_max, rotate_radius, rotate_point )

func move_to_orbit(orbit_cur, orbit_max, radius, pivot_point):
	var orbit_len = (orbit_cur/orbit_max)*(2*PI)
	absolute_move( Vector2(sin(orbit_len)*radius, cos(orbit_len)*radius) + pivot_point )

func absolute_move(to_move):
	move_and_collide(to_move-get_position())

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
