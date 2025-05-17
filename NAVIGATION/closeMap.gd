extends Button

export (PackedScene) var gui_panel_scene = load("res://hamburger/hamburger.tscn")

var container

func _ready():
	container = find_parent("*GUIPanel3D*")

func _pressed():
	Globals.window(container.translation+Vector3(-0.15,0.5,0), null, gui_panel_scene)
	container.queue_free()
