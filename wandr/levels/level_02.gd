extends Node2D
func _ready():
	print("inside level 2!!")
	$player.run_speed = 30  # New run speed for this level
	$player.gravity = 300    # New gravity for this level
	$player.reset($SpawnPoint.position)
	$AudioStreamPlayer2D.play()
