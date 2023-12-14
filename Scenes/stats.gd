extends Node

signal cash_changed
signal bet_changed
signal idle_changed

var cash:int = 8000 

var idle_process_list:IdleProcessList = preload("res://Assets/Resources/idle_process_list.tres")
var idle_process_dict:Dictionary

var upgrade_list:UpgradeList = preload("res://Assets/Resources/upgrade_list.tres")
var upgrade_dict:Dictionary
func _ready():
	idle_process_dict = {}
	for idle_process in idle_process_list.list:
		idle_process_dict[idle_process.name] = idle_process
	
	upgrade_dict = {}
	for upgrade in upgrade_list.list:
		upgrade_dict[upgrade.name] = upgrade

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
