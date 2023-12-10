extends PanelContainer

@onready var main_container = $VBoxContainer/TabContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_blackjack_button_pressed():
	main_container.current_tab = 0


func _on_idle_button_pressed():
	main_container.current_tab = 1


func _on_upgrade_button_pressed():
	main_container.current_tab = 2
