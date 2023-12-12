extends PanelContainer

signal bet_pressed

@onready var spinbox = $VBoxContainer/SpinBox

# Called when the node enters the scene tree for the first time.
func _ready():
	spinbox.max_value = Stats.bet_ceiling


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spin_box_value_changed(value):
	Stats.update_bet(value)


func _on_button_pressed():
	bet_pressed.emit()
	
	
