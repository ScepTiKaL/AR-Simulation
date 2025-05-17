extends LineEdit

func _init():
	visible = false

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo and not Globals.menu:
		if event.is_action_pressed('command'):
			if not has_focus():
				visible = true
				grab_focus()
			else:
				text = ""
				visible = false
				release_focus()
		if has_focus():
			if event.is_action_pressed('release_focus'):
				text = ""
				visible = false
				release_focus()
			if event.is_action_pressed('submit_command'):
				text = ""
				visible = false
				release_focus()
		
