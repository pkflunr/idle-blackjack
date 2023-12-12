extends Node

signal cash_changed
signal bet_changed

var cash:int = 8000 

var current_bet:int = 100

var bet_ceiling:int = 200

var win_multiplier = 2

var lose_multiplier = 1

# how much extra you win = multiplier * bet
var blackjack_multiplier = 0.5

func update_cash(value):
	cash += value
	cash_changed.emit()


func update_bet(value):
	current_bet = value
	bet_changed.emit()

	
