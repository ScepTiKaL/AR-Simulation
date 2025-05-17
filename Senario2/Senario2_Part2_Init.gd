extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var notification_sound = get_node("NotificationStream")
onready var notification_boarded = get_node("boarded_notification")
onready var notification_signal_driver = get_node("signal_driver_notification")
onready var pressE = get_node("pressE")
onready var stop_counter_3 = get_node("BusInterior/StopCounter3")
onready var stop_counter_2 = get_node("BusInterior/StopCounter2")
onready var stop_counter_1 = get_node("BusInterior/StopCounter1")
onready var stop_counter_0 = get_node("BusInterior/StopCounter0")
onready var gatebackdrop = get_node("BusInterior/gatebackdrop")
onready var gate_left = get_node("BusInterior/GateLeft")
onready var gate_right = get_node("BusInterior/GateRight")

# Called when the node enters the scene tree for the first time.
func _ready():
	var tmr = Timer.new()
	tmr.set_wait_time(3)
	tmr.set_one_shot(true)
	self.add_child(tmr)
	notification_sound.stream.set_loop(false)
	notification_sound.play()
	tmr.start()
	yield(tmr, "timeout")
	notification_boarded.hide()
	
	tmr.set_wait_time(5)
	
	tmr.start()
	yield(tmr, "timeout")
	stop_counter_3.hide()
	stop_counter_2.show()
	
	
	tmr.start()
	yield(tmr, "timeout")
	stop_counter_2.hide()
	stop_counter_1.show()
	
	
	tmr.start()
	yield(tmr, "timeout")
	stop_counter_1.hide()
	stop_counter_0.show()
	
	tmr.set_wait_time(3)
	tmr.start()
	notification_signal_driver.show()
	pressE.show()
	notification_sound.play()
	yield(tmr, "timeout")
	pressE.hide()
	notification_signal_driver.hide()
	gatebackdrop.show()
	gate_left.show()
	gate_right.show()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
