extends Node
class_name Deck

var deck:Array[CardData]
const CardData = preload("res://Scripts//card_data.gd")

func create_deck():
	deck = []
	for suit in Card.Suit.values():
		for value in range(1,14):
			deck.append(CardData.new(suit, value))

func draw_card() -> CardData:
	if deck:
		return deck.pop_back()
	else:
		return null

func shuffle_deck():
	if deck:
		deck.shuffle()
