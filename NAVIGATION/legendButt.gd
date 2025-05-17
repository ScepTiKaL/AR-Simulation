extends Button

var legend = preload("res://NAVIGATION/legend.tscn") #this is all i changed
var mapAside = preload("res://planatrip/mapAside.tscn")
var legendPanel
var container



# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("legendButton").connect("pressed",self,"create_legend")
	container = find_parent("*GUIPanel3D*")


func clear_legendPanel():
	legendPanel = null

func _pressed():
	legendPanel = Globals.window(container.translation+Vector3(2.16,0,0),legend,mapAside)
	legendPanel.connect("tree_exiting",self,"clear_legendPanel")
	##legendPanel.gui.map = self
