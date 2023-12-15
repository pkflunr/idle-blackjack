extends Node

@onready var animation_player = $AnimationPlayer
@onready var main_menu_track = $MainMenuAudioStreamPlayer
@onready var upgrade_menu_track = $UpgradeMenuAudioStreamPlayer
@onready var blackjack_menu_track = $BlackjackAudioStreamPlayer

func _ready():
	$MainMenuAudioStreamPlayer.play()

func start_game():
	animation_player.play("MainMenuFadeOut")
	upgrade_menu_track.play()

func switch_to_blackjack():
	animation_player.play("BlackjackMenuFadeIn")
	blackjack_menu_track.play()

func switch_to_upgrade_menu():
	animation_player.play("UpgradeMenuFadeIn")
	upgrade_menu_track.play()
