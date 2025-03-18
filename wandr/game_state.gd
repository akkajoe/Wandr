extends Node
var num_levels = 2
var current_level = 0
var game_scene = "res://levels/level_02.tscn"
var level_one_scene = "res://levels/level_01.tscn"
func restart():
	current_level = 0
	get_tree().change_scene_to_file(level_one_scene)
func next_level():
	current_level += 1
	emit_signal("level_changed", current_level)
	if current_level <= num_levels:
		print('INN')
		get_tree().change_scene_to_file(game_scene)
		
