extends PanelContainer

@onready var money_label = $MarginContainer/HBoxContainer/MoneyLabel
@onready var money_generation_label = $MarginContainer/HBoxContainer/MoneyGenerationLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money_label.text = "$" + str(Stats.cash)
	calculate_money_per_second()
	money_generation_label.text = "$" + str(Stats.money_per_second) + "/second"	
	
func calculate_money_per_second():
	var money_per_second = 0
	for idle_process_key in Stats.idle_process_dict:
		var amount = Stats.idle_process_dict[idle_process_key].value
		var number = Stats.idle_process_dict[idle_process_key].amount
		var time = Stats.idle_process_dict[idle_process_key].time
		var multiplier = Stats.idle_process_dict[idle_process_key].upgrade_multiplier
		money_per_second += (amount * multiplier * number) / time
	Stats.money_per_second = money_per_second
