extends Button

var container

func _ready():
	container = find_parent("*GUIPanel3D*")

func _pressed():
	container.queue_free()
