extends Resource

class_name CardData

var suit:Card.Suit
var value:int

func _init(m_suit:Card.Suit = Card.Suit.DIAMONDS, m_value:int = 1):
	suit = m_suit
	value = m_value
