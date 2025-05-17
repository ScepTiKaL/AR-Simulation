extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Scene objects
onready var speech_bubble = get_node("/root/Senario2_Part1/Speechbubble")
onready var time_adv = get_node("/root/Senario2_Part1/AdvanceTime")
onready var bus_node = get_node("/root/Senario2_Part1/bus")
onready var bus_arr_not = get_node("/root/Senario2_Part1/bus_has_arrived")
onready var notification_sound = get_node("NotificationStream")
onready var left_gate_warning = get_node("/root/Senario2_Part1/GateLeft_Warning")
onready var right_gate_warning = get_node("/root/Senario2_Part1/GateRight_Warning")
onready var left_gate_enter = get_node("/root/Senario2_Part1/GateLeft_Enter")
onready var right_gate_enter = get_node("/root/Senario2_Part1/GateRight_Enter")
onready var gate_backdrop = get_node("/root/Senario2_Part1/GateBackdrop")

# Called when the node enters the scene tree for the first time.
func _ready():
	notification_sound.stream.set_loop(false)

func _pressed():
	#Hide not needed elements
	speech_bubble.hide()
	time_adv.hide()
	#Show new needed elements
	bus_node.show()
	bus_arr_not.show()
	left_gate_warning.show()
	right_gate_warning.show()
	gate_backdrop.show()
	#play notification sound
	notification_sound.play()
	#Wait 3 seconds for the notification to disappear
	var tmr = Timer.new()
	tmr.set_wait_time(3)
	tmr.set_one_shot(true)
	self.add_child(tmr)
	tmr.start()
	yield(tmr, "timeout")
	bus_arr_not.hide()
	
	#Wait 3 more seconds (subject to change) to change the gates from wait to board
	tmr.start()
	yield(tmr, "timeout")
	left_gate_warning.hide()
	right_gate_warning.hide()
	left_gate_enter.show()
	right_gate_enter.show()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
