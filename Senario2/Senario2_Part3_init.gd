extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var notification_sound = get_node("NotificationStream")
onready var notification_fare= get_node("fare")

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
	notification_fare.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
