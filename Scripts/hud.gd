extends PanelContainer

@onready var money_label = $MarginContainer/HBoxContainer/MoneyLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money_label.text = "$" + str(Stats.cash)
