extends PanelContainer

@onready var name_label = $MarginContainer/VBoxContainer/NameLabel
@onready var count_label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer2/CountLabel
@onready var earnings_label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer2/EarningsLabel
@onready var price_label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/PriceLabel
@onready var buy_button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/BuyButton


var idle_process_name:String

func set_idle_process(process:IdleProcess):
	idle_process_name = process.name

func _process(delta):
	var idle_process = Stats.idle_process_dict[idle_process_name]
	name_label.text = idle_process.name
	count_label.text = "Count: " + str(idle_process.amount)
	earnings_label.text = "One earns " + str(idle_process.value * idle_process.upgrade_multiplier) + " every " + str(int(idle_process.time)) + " seconds"
	price_label.text = "$"+str(idle_process.get_current_cost())
	buy_button.disabled = Stats.cash < idle_process.get_current_cost()


func _on_buy_button_pressed():
	Stats.cash -= Stats.idle_process_dict[idle_process_name].get_current_cost()
	Stats.idle_process_dict[idle_process_name].amount += 1
