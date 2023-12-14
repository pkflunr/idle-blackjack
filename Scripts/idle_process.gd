extends Resource
class_name IdleProcess

@export var name:String
@export var value:int
@export var upgrade_multiplier:int
@export var base_cost:int
@export var amount:int
@export var time:float
@export var description:String
@export var texture:Texture2D

func get_current_cost():
	return int(base_cost * pow(1.15, amount))

func get_payout():
	return int(value * amount * upgrade_multiplier)
