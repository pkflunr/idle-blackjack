extends Control

@onready var deck:Deck = $Deck
@onready var dealer_hand_display:HandDisplay = $VBoxContainer/DealerHandDisplay
@onready var player_hand_display:HandDisplay = $VBoxContainer/PlayerHandDisplay
@onready var black_jack_control_panel = $VBoxContainer/BlackJackControlPanel
@onready var win_lose_label = $VBoxContainer/WinLoseLabel

var game_ended = false

const BLACKJACK_VALUE = 21
const DEALER_STAND_THRESHOLD = 17

# Called when the node enters the scene tree for the first time.
func _ready():
	_new_game()

func _new_game():
	game_ended = false
	
	win_lose_label.visible = false
	black_jack_control_panel.set_game_mode()
	
	dealer_hand_display.clear()
	player_hand_display.clear()
	
	deck.create_deck()
	deck.shuffle_deck()
	
	dealer_hand_display.add_card(deck.draw_card(), true)
	dealer_hand_display.add_card(deck.draw_card())
	for i in range(2):
		player_hand_display.add_card(deck.draw_card())
	
	
	if dealer_hand_display.get_hand_value() == BLACKJACK_VALUE and dealer_hand_display.get_hand_value() > player_hand_display.get_hand_value():
		win_lose_label.text = "Dealer Blackjack!"
		lose(true)
	elif player_hand_display.get_hand_value() == BLACKJACK_VALUE:
		win_lose_label.text = "Blackjack!!"
		win(true)
	test_hand_values()

func test_hand_values():
	var dealer_hand_value = dealer_hand_display.get_hand_value()
	var player_hand_value = player_hand_display.get_hand_value()
	if dealer_hand_value > BLACKJACK_VALUE:
		win_lose_label.text = "Dealer bust!"
		win(false)
	elif player_hand_value > BLACKJACK_VALUE:
		win_lose_label.text = "Bust..."
		lose(false)
	elif player_hand_value == BLACKJACK_VALUE:
		# automatically stand
		_on_stand()

func end_game():
	game_ended = true
	win_lose_label.visible = true
	black_jack_control_panel.set_end_mode()
	dealer_hand_display.reveal_hand()

func win(blackjack:bool):
	end_game()
	
func lose(blackjack:bool):
	end_game()

func draw():
	end_game()

func _on_play_again():
	_new_game()


func _on_hit():
	player_hand_display.add_card(deck.draw_card())
	test_hand_values()

func _on_stand():
	if dealer_hand_display.get_hand_value() < DEALER_STAND_THRESHOLD:
		while(dealer_hand_display.get_hand_value() < DEALER_STAND_THRESHOLD):
			# dealer hit
			dealer_hand_display.add_card(deck.draw_card())
			test_hand_values()
	if not game_ended:
		# dealer stand
		var dealer_hand_value = dealer_hand_display.get_hand_value()
		var player_hand_value = player_hand_display.get_hand_value()
		if player_hand_value > dealer_hand_value:
			win_lose_label.text = "You win!"
			win(false)
		elif player_hand_value < dealer_hand_value:
			win_lose_label.text = "You lose..."
			lose(false)
		else:
			win_lose_label.text = "Draw!"
			draw()
