tool
extends Panel

export (String) var listName = "empty"

func _ready():
	if not Engine.editor_hint:
		get_node("CenterContainer/listName").text = listName

func _process(_delta):
	if Engine.editor_hint:
		get_node("CenterContainer/listName").text = listName
