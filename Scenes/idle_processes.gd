extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	for idle_process_key in Stats.idle_process_dict:
		var new_timer:Timer = Timer.new()
		new_timer.autostart = true
		new_timer.wait_time = Stats.idle_process_dict[idle_process_key].time
		new_timer.timeout.connect(payout_process.bind(Stats.idle_process_dict[idle_process_key]))
		add_child(new_timer)

func payout_process(process:IdleProcess):
	Stats.cash += process.get_payout()
