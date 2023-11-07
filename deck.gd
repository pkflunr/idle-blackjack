extends Node

var deck:Array[CardData]

func create_deck():
	deck = []
	for suit in Card.Suit:
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
