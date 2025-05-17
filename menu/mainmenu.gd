extends Control

export (Array, PackedScene) var scenes

var buttons = []
var menubutton = preload("res://menu/menubutton.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	for scene in scenes:
		var btn = menubutton.new()
		buttons.append(btn)
		btn.text = scene.get_state().get_node_name(0)
		btn.scene = scene
		add_child(btn)
