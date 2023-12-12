extends TextureRect
class_name Card
enum Suit {
	hearts,
	diamonds,
	spades,
	clubs,
}

@export var suit:Suit
@export_range(1,13) var value:int

@onready var card_sprite = $VBoxContainer/CardSprite

var faceup = true

# Called when the node enters the scene tree for the first time.
func _ready():
	change_sprite()

func show_front():
#	card_front.visible = true
#	card_back.visible = false
	change_sprite()
	faceup = true


func show_back():
	texture = load("res://Assets/PNG/Cards (large)/card_back.png")
	faceup = false

func change_sprite():
	var suit_text
	match(suit):
		Suit.hearts:
			suit_text = "hearts"
		Suit.diamonds:
			suit_text = "diamonds"
		Suit.spades:
			suit_text = "spades"
		Suit.clubs:
			suit_text = "clubs"

	# handle the card sprite
	match(value):
		13:
			texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_text,"_K.png"))
		12:
			texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_text,"_Q.png"))
		11:
			texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_text,"_J.png"))
		10:
			texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_text,"_10.png"))
		1:
			texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_text,"_A.png"))
		_:
			texture = load(str("res://Assets/PNG/Cards (large)/card_", suit_text, "_0", value, ".png"))
