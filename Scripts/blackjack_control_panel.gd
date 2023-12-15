extends PanelContainer

@onready var hit_button = $HBoxContainer/HitButton
@onready var stand_button = $HBoxContainer/StandButton
@onready var play_again_button = $HBoxContainer/PlayAgainButton

signal hit
signal stand
signal play_again

func set_game_mode():
	hit_button.visible = true
	stand_button.visible = true
	play_again_button.visible = false

func set_end_mode():
	hit_button.visible = false
	stand_button.visible = false
	play_again_button.visible = true
	
func set_bet_mode():
	hit_button.visible = false
	stand_button.visible = false
	play_again_button.visible = false
	

func _process(delta):
	play_again_button.disabled = Stats.cash < Stats.current_bet

func _on_hit_button_pressed():
	hit.emit()



func _on_stand_button_pressed():
	stand.emit()



func _on_play_again_button_pressed():
	play_again.emit()
