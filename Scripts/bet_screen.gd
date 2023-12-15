extends PanelContainer

signal bet_pressed

@onready var spinbox = $VBoxContainer2/VBoxContainer/SpinBox
@onready var save_button = $VBoxContainer2/SaveButton


# Called when the node enters the scene tree for the first time.
func _ready():
	spinbox.get_line_edit().mouse_filter = MOUSE_FILTER_IGNORE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Stats.cash < Stats.bet_ceiling:
		spinbox.max_value = Stats.cash
	else:
		spinbox.max_value = Stats.bet_ceiling

func update_bet():
	Stats.update_bet(spinbox.value)


func _on_button_pressed():
	bet_pressed.emit()
	


func _on_save_button_pressed():
	Stats.save_game()
	save_button.text = "Saved!"
	await get_tree().create_timer(2).timeout
	save_button.text = "Save Game"
