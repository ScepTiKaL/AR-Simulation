extends Panel

export (String) var title = "Name"

var vbox
var currentTime = 71

const listElement = preload("res://planatrip/routeListElement.tscn")

const busIcon = preload("res://planatrip/busIcon.png")

func _ready():
	get_node("CenterContainer/listName").text = title
	vbox = get_node("VBoxContainer")

	#add_element(busIcon,"11","1:20","11 min")

func add_element(icon,route,time,arrTime,colour):
	var element = listElement.instance()

	var formattedTime = convertTime(time + currentTime)
	var formattedArrtime = convertTime(arrTime + currentTime)

	element.get_node("Button/HBoxContainer/HBoxContainer/Control/Sprite").texture = icon
	element.get_node("Button/HBoxContainer/HBoxContainer/CenterContainer/RouteNumber").text = route
	element.get_node("Button/HBoxContainer/HBoxContainer/VBoxContainer2/time").text = formattedTime
	element.get_node("Button/HBoxContainer/HBoxContainer/VBoxContainer3/time").text = formattedArrtime
	element.get_node("Button/HBoxContainer/VBoxContainer/time").text = str(arrTime-time) + "min"

	element.colour = colour

	vbox.add_child(element)

func convertTime(time):
	var hours = time/60
	var minutes  = time % 60
	if hours > 0:
		return str(hours) + ":" + str(minutes) + "pm"
	else:
		return str(minutes)
