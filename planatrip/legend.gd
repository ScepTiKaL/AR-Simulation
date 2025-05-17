extends Panel

var map
var vBox

func _ready():
	vBox = get_node("VBoxContainer")
	vBox.get_node("policeButton").connect("toggled",self,"police_pressed")
	vBox.get_node("hospitalButton").connect("toggled",self,"hospital_pressed")
	vBox.get_node("stationButton").connect("toggled",self,"station_pressed")

func police_pressed(button_pressed):
	for station in map.get_node("policeStations").get_children():
		station.visible = button_pressed

func hospital_pressed(button_pressed):
	for hospital in map.get_node("hospitals").get_children():
		hospital.visible = button_pressed

func station_pressed(button_pressed):
	for station in map.get_node("trainStations").get_children():
		station.visible = button_pressed
