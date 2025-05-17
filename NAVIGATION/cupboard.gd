extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mapMan
var baseMap

# Called when the node enters the scene tree for the first time.
func _ready():
	mapMan = get_parent().get_node("mapManPathPoint")
	baseMap = get_parent().get_node("mapCrop")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	mapMan.visible=true
	baseMap.visible=false
	find_parent("Navigation").get_node("floorArrows").visible=true;
	find_parent("Navigation").get_node("highArrow").visible = true;
