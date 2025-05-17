extends Panel

var container

var busList = preload("res://planatrip/busList.tscn")
var legend = preload("res://planatrip/legend.tscn")
var mapAside = preload("res://planatrip/mapAside.tscn")

var busListPanel
var legendPanel
var busButtons

func _ready():
	container = find_parent("*GUIPanel3D*")
	get_node("uniDest").connect("pressed", self, "create_bus_list") #Connect uniDest's button pressed event to create_bus_list function
	get_node("legendButton").connect("pressed",self,"create_legend")
	busButtons = get_node("busButtons")

#Create bus list when Uni button is pressed
func create_bus_list():
	busListPanel = Globals.window(container.translation+Vector3(-2.16,0,0),busList,mapAside)
	busListPanel.connect("tree_exiting",self,"clear_busListPanel")
	busListPanel.get_node("Viewport").get_node("gui").addBuses(busButtons.get_children())
	get_node("destination").visible = true
	get_node("CenterContainer/selectDest").visible = false
	#for child in busButtons.get_children():
	#	child.visible = true

func _exit_tree():
	if busListPanel:
		busListPanel.queue_free()
	if legendPanel:
		legendPanel.queue_free()

func clear_busListPanel():
	busListPanel = null

func clear_legendPanel():
	legendPanel = null

func create_legend():
	legendPanel = Globals.window(container.translation+Vector3(2.16,0,0),legend,mapAside)
	legendPanel.connect("tree_exiting",self,"clear_legendPanel")
	legendPanel.gui.map = self
