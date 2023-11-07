extends PanelContainer
class_name Card
enum Suit {
	HEARTS,
	DIAMONDS,
	SPADES,
	CLUBS,
}

@export var suit:Suit
@export_range(1,13) var value:int

@onready var suit_label = $VBoxContainer/SuitLabel
@onready var value_label = $VBoxContainer/ValueLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	# handle the card suit
	match(suit):
		Suit.HEARTS:
			suit_label.text = "h"
			_set_text_to_red()
		Suit.DIAMONDS:
			suit_label.text = "d"
			_set_text_to_red()
		Suit.SPADES:
			suit_label.text = "s"
		Suit.CLUBS:
			suit_label.text = "c"
	
	# handle the card value
	match(value):
		13:
			value_label.text = "K"
		12:
			value_label.text = "Q"
		11:
			value_label.text = "J"
		1:
			value_label.text = "A"
		_:
			value_label.text = str(value)

# changes this card's text to red instead of black
func _set_text_to_red():
	suit_label.add_theme_color_override("font_color", Color.RED)
	value_label.add_theme_color_override("font_color", Color.RED)
