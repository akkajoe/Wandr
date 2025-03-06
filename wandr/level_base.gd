extends Node2D

var door_scene = load("res://items/door.tscn")

func _ready():
	#$player.reset($SpawnPoint.position)
	spawn_items()
func spawn_items():
	var item_cells = $Door.get_used_cells()
	for cell in item_cells:
		var data = $Door.get_cell_tile_data(cell)
		var type = data.get_custom_data("type")
		if type == "door":
			print("yesss")
			var door = door_scene.instantiate()
			add_child(door)
			door.position = $Door.map_to_local(cell)
			door.body_entered.connect(_on_door_entered)
		#else:
			##var item = item_scene.instantiate()
			#add_child(item)
			#item.init(type, $Items.map_to_local(cell))
			#item.picked_up.connect(self._on_item_picked_up)s

func _on_door_entered(body):
	GameState.next_level()
	
