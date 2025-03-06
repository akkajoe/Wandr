extends Node

var num_levels = 2
var current_level = 1
var game_scene = 'res://Main/main.tscn'
func restart():
	current_level = 1
	get_tree().change_scene_to_file('res://levels/level_01.tscn')
func next_level():
	current_level += 1
	if current_level <= num_levels:
		get_tree().call_deferred("change_scene_to_file", game_scene)
