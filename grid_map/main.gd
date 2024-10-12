extends Node2D

var mouse_input = 'none'
@export var items = [["Back", 2], ["Arrow", 5]]
@onready var inv_ui = $CanvasLayer/Inv_UI
var dict = PlateDict

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parse_items()

func parse_items():
	var new_items = []
	for item in items:
		new_items.append([dict.inv_items.get(item[0]), item[1]])
	inv_ui.insert_into_slots(new_items)
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			select()
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			print("Wheel up")
			mouse_input = "wheel up"

func select():
	var mouse_pos = $TileMapLayer2.local_to_map(get_local_mouse_position())
	if $TileMapLayer.get_cell_tile_data(mouse_pos):
		var pos = $TileMapLayer2.map_to_local(mouse_pos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
