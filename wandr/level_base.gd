extends Node2D

var door_scene = load("res://items/door.tscn")

func _ready():
	# Optionally hide the Items TileMap if you don't want it visible during gameplay.
	# $Items.hide()
	
	# Reset the player’s position (and scale) using the SpawnPoint node
	$player.reset($SpawnPoint.position)
	
func spawn_items():
	var item_cells = $Items.get_used_cells(0)
	for cell in item_cells:
		var data = $Items.get_cell_tile_data(0, cell)
		var type = data.get_custom_data("type")
		if type == "door":
			var door = door_scene.instantiate()
			add_child(door)
			door.position = $Items.map_to_local(cell)
			door.body_entered.connect(_on_door_entered)
		#else:
			##var item = item_scene.instantiate()
			#add_child(item)
			#item.init(type, $Items.map_to_local(cell))
			#item.picked_up.connect(self._on_item_picked_up)

func _on_door_entered(body):
	GameState.next_level()
	
