extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

func _on_timer_timeout():
	calcMoney()
	$Timer.start()

func calcMoney():
	return (Stats.idle_dict["thirdIdle"] * Stats.idle_amt_dict["thirdIdle"] * Stats.idle_multiplier_dict["thirdIdle"])
