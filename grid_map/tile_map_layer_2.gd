extends TileMapLayer

var mouse_pos: Vector2i = Vector2i(-1, -1)
@onready var level = $"../TileMapLayer"
signal can_place

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	erase_cell(mouse_pos)
	mouse_pos = local_to_map(get_local_mouse_position())
	var level_tile: TileData = level.get_cell_tile_data(mouse_pos)
	if level_tile and level_tile.get_custom_data("can_place"):
		set_cell(mouse_pos, 0, Vector2i(0, 0), 0)
		can_place.emit()
