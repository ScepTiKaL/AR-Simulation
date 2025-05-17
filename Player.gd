extends Spatial

# The speed of the camera movement
const move_speed = 2
# Mouse move distance
const mouse_radius = 4
#onready var mouse_squared_radius = mouse_radius*mouse_radius
# View angle velocity
const view_angle_velocity = 0.005

# The current movement
var velocity = Vector3(0,0,0)
# The current angular movement
var avelocity = Vector2(0,0)

var raycaster

func _init():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _ready():
	raycaster = get_node(NodePath("Camera/RayCast"))

func _process(delta):
	if(not Globals.move_locked()):
		translate_object_local(velocity*delta)
		if velocity != Vector3(0,0,0):
			var mouse_event = InputEventMouseMotion.new()
			mouse_event.global_position = get_viewport().get_mouse_position()
			mouse_event.position = get_viewport().get_mouse_position()
			mouse_event.button_mask = Input.get_mouse_button_mask()
			Input.parse_input_event(mouse_event)

	var other = raycaster.get_collider()
	if other:
		var p = other.get_parent().get_parent()
		if p is gui_3d:
			for gui in Globals.gui_3ds:
				if gui == p:
					gui.is_mouse_inside = true
				else:
					gui.is_mouse_inside = false

func _unhandled_input(event):
	if(not Globals.move_locked()):
		if event is InputEventMouseMotion:
			var camera = get_viewport().get_camera()
			rotate_object_local(Vector3(0,1,0),-view_angle_velocity*event.relative.x)
			camera.rotate_object_local(Vector3(1,0,0),-view_angle_velocity*event.relative.y)

	if event is InputEventKey:
		_move(event)

func _move(event):
	if(not Globals.move_locked()):
		if event.pressed and not event.echo:
			if event.is_action_pressed('right'):
				velocity += Vector3(move_speed,0,0)
			if event.is_action_pressed('left'):
				velocity += Vector3(-move_speed,0,0)
			if event.is_action_pressed('forward'):
				velocity += Vector3(0,0,-move_speed)
			if event.is_action_pressed('back'):
				velocity += Vector3(0,0,move_speed)
		elif not event.pressed:
			if event.is_action_released('right'):
				velocity -= Vector3(move_speed,0,0)
			if event.is_action_released('left'):
				velocity -= Vector3(-move_speed,0,0)
			if event.is_action_released('forward'):
				velocity -= Vector3(0,0,-move_speed)
			if event.is_action_released('back'):
				velocity -= Vector3(0,0,move_speed)
	if event.pressed and not event.echo:
		if event.is_action_pressed('menu'):
			Globals.menu = not Globals.menu
			if(Globals.menu):
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
