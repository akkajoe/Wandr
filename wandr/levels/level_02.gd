extends Node2D
func _ready():
	print("inside level 2!!")
	$player.run_speed = 50  # New run speed for this level
	$player.gravity = 300    # New gravity for this level
	$player.reset($SpawnPoint.position)
	set_camera_limits()

func set_camera_limits():
	var map_size = $World.get_used_rect()          

	# Left/Right (with optional padding)
	#$player/Camera2D.limit_left  = map_size.position.x * cell_size.x
	#$player/Camera2D.limit_right = map_size.end.x      * cell_size.x

	## Top/Bottom (no extra offsets)
	#$player/Camera2D.limit_top    = map_size.position.y * cell_size.y
	#$player/Camera2D.limit_bottom = map_size.end.y      * cell_size.y
