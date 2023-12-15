extends Node

signal cash_changed
signal bet_changed
signal idle_changed

var cash:int = 100
var money_per_second = 0

var idle_process_list:IdleProcessList = preload("res://Assets/Resources/idle_process_list.tres")
var idle_process_dict:Dictionary

var upgrade_list:UpgradeList = preload("res://Assets/Resources/upgrade_list.tres")
var upgrade_dict:Dictionary

var save_location:String = "user://save_data.json"

func new_game():
	idle_process_dict = {}
	for idle_process in idle_process_list.list:
		idle_process_dict[idle_process.name] = idle_process
	
	upgrade_dict = {}
	for upgrade in upgrade_list.list:
		upgrade_dict[upgrade.name] = upgrade

func save_game():
	var saved_upgrade_list:UpgradeList = UpgradeList.new()
	var saved_process_list:IdleProcessList = IdleProcessList.new()
	saved_upgrade_list.list = []
	saved_process_list.list = []
	
	for key in upgrade_dict:
		saved_upgrade_list.list.append(upgrade_dict[key])
	for key in idle_process_dict:
		saved_process_list.list.append(idle_process_dict[key])
	
	ResourceSaver.save(saved_upgrade_list, "user://saved_upgrade_list.tres")
	ResourceSaver.save(saved_process_list, "user://saved_process_list.tres")
	FileAccess.open("user://money.money", FileAccess.WRITE).store_64(cash)

func load_game():
	var saved_upgrade_list:UpgradeList = load("user://saved_upgrade_list.tres")
	var saved_process_list:IdleProcessList = load("user://saved_process_list.tres")
	idle_process_dict = {}
	for idle_process in saved_process_list.list:
		idle_process_dict[idle_process.name] = idle_process
	
	upgrade_dict = {}
	for upgrade in saved_upgrade_list.list:
		upgrade_dict[upgrade.name] = upgrade
	
	cash = FileAccess.open("user://money.money", FileAccess.READ).get_64()

var current_bet:int = 100

var bet_ceiling:int = 200

var win_multiplier:float = 3

var lose_multiplier:float = 1

# how much extra you win = multiplier * bet
var blackjack_multiplier:float = 1

func update_cash(value):
	cash += value
	cash_changed.emit()


func update_bet(value):
	current_bet = value
	bet_changed.emit()
