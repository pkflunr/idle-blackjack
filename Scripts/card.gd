extends PanelContainer
class_name Card
enum Suit {
	hearts,
	diamonds,
	spades,
	clubs,
}

@export var suit:Suit
@export_range(1,13) var value:int

@onready var suit_label = $VBoxContainer/SuitLabel
@onready var value_label = $VBoxContainer/ValueLabel
@onready var card_sprite = $VBoxContainer/CardSprite

@onready var card_front = $VBoxContainer
@onready var card_back = $CardBackLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	change_sprite()

# changes this card's text to red instead of black
func _set_text_to_red():
	suit_label.add_theme_color_override("font_color", Color.RED)
	value_label.add_theme_color_override("font_color", Color.RED)

func show_front():
#	card_front.visible = true
#	card_back.visible = false
	change_sprite()


func show_back():
	card_sprite.texture = load("res://Assets/PNG/Cards (large)/card_back.png")

func change_sprite():
	match(suit):
		Suit.hearts:
			suit_label.text = "hearts"
			_set_text_to_red()
		Suit.diamonds:
			suit_label.text = "diamonds"
			_set_text_to_red()
		Suit.spades:
			suit_label.text = "spades"
		Suit.clubs:
			suit_label.text = "clubs"

	# handle the card sprite
	match(value):
		13:
			card_sprite.texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_label.text,"_K.png"))
		12:
			card_sprite.texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_label.text,"_Q.png"))
		11:
			card_sprite.texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_label.text,"_J.png"))
		10:
			card_sprite.texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_label.text,"_10.png"))
		1:
			card_sprite.texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_label.text,"_A.png"))
		_:
			card_sprite.texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_label.text, "_0", value, ".png"))
