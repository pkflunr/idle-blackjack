extends Button


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_screen.tscn")

func _on_load_game_pressed():
	# do some loading here
	get_tree().change_scene_to_file("res://Scenes/main_screen.tscn")
