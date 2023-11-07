extends Control

@onready var deck:Deck = $Deck
@onready var dealer_hand_display:HandDisplay = $VBoxContainer/DealerHandDisplay

# Called when the node enters the scene tree for the first time.
func _ready():
	deck.create_deck()
	deck.shuffle_deck()
	
	for i in range(3):
		dealer_hand_display.add_card(deck.draw_card())
	print("value of hand: " + str(dealer_hand_display.get_hand_value()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
