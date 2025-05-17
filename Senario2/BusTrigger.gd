extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var collision_area = get_node("Area")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if collision_area.get_overlapping_areas().size() > 0:
		var next_level_resource = load("res://Senario2/Senario2_Part2.tscn")
		Globals.change_level(next_level_resource)
