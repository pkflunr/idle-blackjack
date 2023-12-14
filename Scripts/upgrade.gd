extends Resource
class_name Upgrade

# temp
enum UpgradeType {
	CHANGE_BET_CEILING,
	CHANGE_WIN_MULTIPLIER,
	CHANGE_LOSE_MULTIPLIER,
	CHANGE_BLACKJACK_MULTIPLIER,
	UPGRADE_IDLE
}

@export var type:UpgradeType
@export var name:String # display only
@export var price:int # how much this upgrade costs
@export var description:String # displayed in upgrade widget
@export var value:float # the amount that the corresponding thing will be set to
@export var idle_process_name:String # used only by UPGRADE_IDLE, the name of the process to upgrade
@export var obtained:bool
@export var prerequisites:Array[String] # if any of the upgrades in this array are unobtained, then this upgrade should be invisible

func do_action():
	match(type):
		UpgradeType.CHANGE_BET_CEILING:
			Stats.bet_ceiling = value
		UpgradeType.CHANGE_WIN_MULTIPLIER:
			Stats.win_multiplier = value
		UpgradeType.CHANGE_LOSE_MULTIPLIER:
			Stats.lose_multiplier = value
		UpgradeType.CHANGE_BLACKJACK_MULTIPLIER:
			Stats.blackjack_multiplier = value
		UpgradeType.UPGRADE_IDLE:
			Stats.idle_process_dict[idle_process_name].upgrade_multiplier = value
		_:
			pass
