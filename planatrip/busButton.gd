tool
extends Control

export (Vector2) var toPoint = Vector2(0,0)
export (Color) var colour = Color(0,0,0,1)
export (float) var duration = 400
export (Texture) var texture = preload("res://planatrip/busIcon.png")
export (String) var routeName = "11"
export (Array, int) var timesMinutes = [11,27,43,70,95] #The first element has to be the least
export (Array, int) var arrTime = [15,32,50,74,110]

var timeList = preload("res://planatrip/routeTimeList.tscn")

var container
var line = null
var button = null
var percent = 0

var start_position

func _ready():
	container = find_parent("*GUIPanel3D*")
	line = get_node("line")
	button = get_node("TextureButton")

	line.default_color = colour
	line.points[0] = toPoint

	for child in get_children():
		if child is Line2D:
			child.default_color = colour

	button.texture_normal = texture
	button.self_modulate = colour
	button.connect("pressed",self,"_press")

func _process(delta):
	if Engine.editor_hint:
		if not line:
			line = get_node("line")
		else:
			line.default_color = colour
			line.points[0] = toPoint
		button.texture_normal = texture
		button.self_modulate = colour
	else:
		if visible:
			percent += delta/duration
			button.rect_position = line.points[1].linear_interpolate(line.points[0],percent)

func _press():
	var newTimeList = Globals.window(container.translation + 0.1*Vector3(sin(container.rotation.y),0,cos(container.rotation.y)),timeList)
	var newTimeListGui = newTimeList.get_node("Viewport").get_node("gui")
	newTimeListGui.get_node("CenterContainer/listName").text = "Route " + routeName
	for i in range(len(timesMinutes)):
		newTimeListGui.add_element(texture,routeName,timesMinutes[i],arrTime[i],colour)

func _toggle_visible(button_pressed):
	visible = button_pressed
