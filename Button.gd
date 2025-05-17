extends Button

export (PackedScene) var gui
export (PackedScene) var gui_panel = load("res://gui_panel_3d.tscn")

var container

func _ready():
	container = find_parent("*GUIPanel3D*")

func _pressed():
	var newposition = container.translation + 0.1*Vector3(sin(container.rotation.y),0,cos(container.rotation.y))
	Globals.window(newposition,gui,gui_panel)
