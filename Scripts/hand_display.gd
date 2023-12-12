extends PanelContainer
class_name HandDisplay

@export var hand_name:String
@export var card_scene:PackedScene

@onready var hand_name_label = $MarginContainer/VBoxContainer/HBoxContainer/HandNameLabel
@onready var card_container = $MarginContainer/VBoxContainer/CardContainer
@onready var value_label = $MarginContainer/VBoxContainer/HBoxContainer/ValueLabel

var cards:Array[Card]
var cards_data:Array[CardData]

const threshold = 21
const ace_alt_value = 11

# Called when the node enters the scene tree for the first time.
func _ready():
	hand_name_label.text = hand_name
	cards = []
	cards_data = []

func add_card(card_data:CardData, facedown:bool=false):
	cards_data.append(card_data)
	var new_card:Card = card_scene.instantiate()
	new_card.value = card_data.value
	new_card.suit = card_data.suit
	cards.append(new_card)
	card_container.add_child(new_card)
	
	if facedown:
		new_card.show_back()
	
	_update_value_label()

func _update_value_label():
	value_label.text = "Hand Value: " + (str(get_hand_value()) if cards[0].faceup else "?") 

func clear():
	cards.clear()
	cards_data.clear()
	for child in card_container.get_children():
		child.queue_free()

func get_hand_value() -> int:
	var total_value = 0
	var ace_count = 0
	for card_data in cards_data:
		match card_data.value:
			13:
				total_value += 10
			12:
				total_value += 10
			11:
				total_value += 10
			1:
				ace_count += 1
			_:
				total_value += card_data.value
	# now every card but ace has been handled; now handle aces
	if ace_count > 0:
		if ace_alt_value + ace_count - 1 + total_value > threshold:
			total_value += ace_count
		else:
			total_value += (ace_count - 1 + ace_alt_value)
	
	return total_value


func reveal_hand():
	for card in cards:
		card.show_front()
	_update_value_label()
