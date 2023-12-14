extends PanelContainer

var upgrade_name:String

@onready var name_label = $MarginContainer/VBoxContainer/NameLabel
@onready var description_label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/DescriptionLabel
@onready var price_label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/PriceLabel
@onready var buy_button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/BuyButton
@onready var texture_rect = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect


func set_upgrade_name(upgrade:Upgrade):
	upgrade_name = upgrade.name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var upgrade:Upgrade = Stats.upgrade_dict[upgrade_name]
	name_label.text = upgrade.name
	description_label.text = upgrade.description
	price_label.text = "$" + str(upgrade.price)
	buy_button.disabled = Stats.cash < upgrade.price
	texture_rect.texture = upgrade.texture
	
	var prereqs_obtained = true
	for prereq_name in upgrade.prerequisites:
		if not Stats.upgrade_dict[prereq_name].obtained:
			prereqs_obtained = false
	
	visible = (not upgrade.obtained) and prereqs_obtained

func _on_buy_button_pressed():
	Stats.cash -= Stats.upgrade_dict[upgrade_name].price
	Stats.upgrade_dict[upgrade_name].obtained = true
	Stats.upgrade_dict[upgrade_name].do_action()
