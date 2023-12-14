extends Resource
class_name Upgrade

# temp
enum UpgradeType {
	CHANGE_BET_AMOUNT,
	CHANGE_BET_MULTIPLIER,
	UPGRADE_IDLE
}

@export var type:UpgradeType
@export var name:String


func do_action():
	# temp
	match(type):
		UpgradeType.CHANGE_BET_AMOUNT:
			pass
		UpgradeType.CHANGE_BET_MULTIPLIER:
			pass
