extends "res://Button.gd"

func _pressed():
	self.pressed = true
	var newposition = container.translation + 0.1*Vector3(sin(container.rotation.y),0,cos(container.rotation.y))
	Globals.window(newposition,gui,load("res://dialog_panel.tscn"))
