extends Panel

var vbox
var currentTime = 71

var container

var buttonGroup

const listElement = preload("res://planatrip/listElement.tscn")

const dialogPanel = preload("res://dialog_panel.tscn")
const trackedDialog = preload("res://planatrip/tracked.tscn")

func _ready():
	container = find_parent("*GUIPanel3D*")
	vbox = get_node("VBoxContainer")
	buttonGroup = ButtonGroup.new()

func addBuses(busses):
	for bus in busses:
		var newElement = add_element(bus.texture,bus.routeName,bus.timesMinutes[0],bus.colour)
		newElement.get_node("Button").group = buttonGroup
		newElement.get_node("Button").connect("toggled",bus,"_toggle_visible")
		newElement.get_node("Button").connect("toggled",self,"createDialog")

func add_element(icon,route,time,colour):
	var element = listElement.instance()

	var formattedTime = convertTime(time + currentTime)

	element.get_node("Button/HBoxContainer/HBoxContainer/Control/Sprite").texture = icon
	element.get_node("Button/HBoxContainer/HBoxContainer/CenterContainer/RouteNumber").text = route
	element.get_node("Button/HBoxContainer/VBoxContainer/time").text = formattedTime
	element.get_node("Button/HBoxContainer/VBoxContainer/timeUntil").text = str(time) + "mins"

	element.gap = 0
	element.colour = colour

	element.get_node("Button").toggle_mode = true

	vbox.add_child(element)

	return element

func convertTime(time):
	var hours = time/60
	var minutes  = time % 60
	if hours > 0:
		return str(hours) + ":" + str(minutes) + "pm"
	else:
		return str(minutes)


func createDialog(button_pressed):
	if button_pressed:
		Globals.window(container.translation + 0.1*Vector3(sin(container.rotation.y),0,cos(container.rotation.y)),trackedDialog,dialogPanel)
