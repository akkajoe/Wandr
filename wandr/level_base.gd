extends Node2D

var door_scene = load("res://items/door.tscn")

func _ready():
	print('check')
	spawn_items()
	set_camera_limits()
func spawn_items():
	var item_cells = $Door.get_used_cells()
	for cell in item_cells:
		var data = $Door.get_cell_tile_data(cell)
		var type = data.get_custom_data("type")
		if type == "door":
			var door = door_scene.instantiate()
			add_child(door)
			door.position = $Door.map_to_local(cell)
			door.body_entered.connect(_on_door_entered)
		#else:
			##var item = item_scene.instantiate()
			#add_child(item)
			#item.init(type, $Items.map_to_local(cell))
			#item.picked_up.connect(self._on_item_picked_up)s

func _on_door_entered(_body):
	print("yesss")
	GameState.next_level()

func set_camera_limits():
	var map_size = $World.get_used_rect()       
	var cell_size = $World.tile_set.tile_size    

	# Left/Right (with optional padding)
	$player/Camera2D.limit_left  = map_size.position.x * cell_size.x
	$player/Camera2D.limit_right = map_size.end.x      * cell_size.x

	# Top/Bottom (no extra offsets)
	$player/Camera2D.limit_top    = map_size.position.y * cell_size.y
	$player/Camera2D.limit_bottom = map_size.end.y      * cell_size.y
