extends TileMapLayer

var mouse_pos: Vector2i = Vector2i(-1, -1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	erase_cell(mouse_pos)
	mouse_pos = local_to_map(get_local_mouse_position())
	set_cell(mouse_pos, 0, Vector2i(0, 0), 0)
