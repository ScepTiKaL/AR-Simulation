extends LineEdit

func _ready():
	var e = connect("focus_exited", get_node(NodePath("../../../..")), "on_keyboard_focus_exited")
	if e:
		print("focus_exited connet error ",e)
	e = connect("focus_entered", get_node(NodePath("../../../..")), "on_keyboard_focus_entered")
	if e:
		print("focus_entered connet error ",e)

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if event.is_action_pressed('release_focus'):
			release_focus()
