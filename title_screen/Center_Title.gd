extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var font_length=540
var font_size=150

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_global_position(Vector2(OS.get_window_size().x/2-font_length/2,OS.get_window_size().y/2-font_size/2))
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
