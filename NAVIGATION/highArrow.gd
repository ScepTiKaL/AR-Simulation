extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	translation = Globals.player.translation + 4*Vector3(cos(-Globals.player.rotation.y-PI/2),1,sin(-Globals.player.rotation.y-PI/2))
	var target = get_parent().get_node("cupboard").get_translation()
	rotation.y = Vector2(target.x,target.y).angle_to(Vector2(translation.x, translation.z)) + PI
	#rotation.y = Globals.player.rotation.y
	#MeshInstance/HArrow2
