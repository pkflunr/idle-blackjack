extends Node

signal cash_changed
signal bet_changed
signal idle_changed

var cash:int = 8000 

var idle_dict = {"firstIdle": 1, "secondIdle": 10, "thirdIdle": 100}

var idle_multiplier_dict = {"firstIdle": 1, "secondIdle": 1, "thirdIdle": 1}

var idle_cost_dict = {"firstIdle": 100, "secondIdle": 10000, "thirdIdle": 1000000}

var idle_amt_dict = {"firstIdle": 1, "secondIdle": 0, "thirdIdle": 0}

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
	

func update_idle_auto_cash(tier, value):
	
	idle_changed.emit()
	
