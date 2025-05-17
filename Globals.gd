extends Node

var menu = false

var focusAbles = []
var gui_3ds = []

var gui_panel = preload("res://gui_panel_3d.tscn")

var root
var current_level
var player = null


func _ready():
	root = get_parent()

	current_level = root.get_node(NodePath("mainmenu"))

func _setup():
	if player:
		focusAbles.append(player.get_node(NodePath("Camera/Command")))
	
	for node in current_level.get_children():
		if node is gui_3d:
			gui_3ds.append(node)
			focusAbles.append(node.get_node(NodePath("Viewport/gui")))
		elif node:
			_walk_setup(node)

func _walk_setup(child):
	for node in child.get_children():
		if node is gui_3d:
			gui_3ds.append(node)
			focusAbles.append(node.get_node(NodePath("Viewport/gui")))
		else:
			_walk_setup(node)


func move_locked():
	if menu:
		return true
	for focusAble in focusAbles:
		if focusAble.get_focus_owner() is LineEdit:
			return true
	return false


func window(position, gui_scene, gui_panel_scene=null):
	var panel
	if gui_panel_scene == null:
		panel = gui_panel.instance()
	else:
		panel = gui_panel_scene.instance()
	if gui_scene:
		panel.gui_scene = gui_scene
	panel.translation = position
	current_level.add_child(panel)
	focusAbles.append(panel.get_node(NodePath("Viewport/gui")))
	gui_3ds.append(panel)

	return panel

func change_level(new,run_globals_setup=true):
	root.remove_child(current_level)
	current_level.call_deferred("free")

	current_level = new.instance()

	if run_globals_setup:
		current_level.connect("ready",self,"_setup")

	var newPlayer = current_level.get_node_or_null("Player")

	if player:
		focusAbles.erase(player.get_node(NodePath("Camera/Command")))

		if newPlayer:
			newPlayer.velocity = player.velocity
			newPlayer.avelocity = player.avelocity

	player = newPlayer

	root.add_child(current_level)
