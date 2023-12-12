extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Stats.connect('cash_changed', update_cash_text)
	update_cash_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_cash_text():
	$MoneyLabel.text = "Cash: $" + str(Stats.cash)
