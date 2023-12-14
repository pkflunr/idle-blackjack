extends PanelContainer

signal bet_pressed

@onready var spinbox = $VBoxContainer/SpinBox

# Called when the node enters the scene tree for the first time.
func _ready():
	spinbox.get_line_edit().mouse_filter = MOUSE_FILTER_IGNORE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spinbox.max_value = Stats.bet_ceiling


func update_bet():
	Stats.update_bet(spinbox.value)


func _on_button_pressed():
	bet_pressed.emit()
	
	
