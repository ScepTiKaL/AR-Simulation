extends gui_3d


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var collision_area = get_node("Quad/Area")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if collision_area.overlaps_area(get_node("/root/Player/Area")):
		print('Works')
