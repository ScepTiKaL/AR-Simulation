tool
extends VBoxContainer

export(int) var gap = 152
var theSize = 48
var colour = Color(0,0,0,1)

func _ready():
	get_node("Button/HBoxContainer/HBoxContainer").rect_min_size.x = gap+theSize
	get_node("Button/HBoxContainer/HBoxContainer").rect_size.x = gap+theSize
	get_node("Button/HBoxContainer/HBoxContainer/Control/Sprite").self_modulate = colour

func _process(_delta):
	if Engine.editor_hint:
		get_node("Button/HBoxContainer/HBoxContainer").rect_min_size.x = gap+theSize
		get_node("Button/HBoxContainer/HBoxContainer").rect_size.x = gap+theSize
		get_node("Button/HBoxContainer/HBoxContainer/Control/Sprite").self_modulate = colour
