extends Button


func _on_new_game_pressed():
	MusicScene.start_game()
	Stats.new_game()
	get_tree().change_scene_to_file("res://Scenes/main_screen.tscn")

func _on_load_game_pressed():
	# do some loading here
	if Stats.load_game():
		MusicScene.start_game()
		get_tree().change_scene_to_file("res://Scenes/main_screen.tscn")
