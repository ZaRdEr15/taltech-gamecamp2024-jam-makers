extends Node2D

var mouse_input = 'none'
@export var items = [["Back", 0], ["Arrow", 2], ["Jump", 0]]
@onready var inv_ui = $CanvasLayer/Inv_UI
var dict = PlateDict
@export var item_name: String
@export var selected_item: BasePlate
@export var item_to_place: BasePlate
var can_place: bool = false
@onready var layers := $"Layers".get_children()
var i := 0
var tiles = {}

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
		if Input.is_action_just_pressed("click") and event.pressed:
			select()

func select():
	if selected_item and can_place:
		item_to_place = selected_item.duplicate()
		var mouse_pos = $FrameTileMapLayer.local_to_map(get_local_mouse_position())
		if layers[0].get_cell_tile_data(mouse_pos) and !tiles.get(mouse_pos) and inv_ui.not_empty(item_name):
			print(item_to_place)
			tiles[mouse_pos] = item_to_place
			var pos = $FrameTileMapLayer.map_to_local(mouse_pos)
			item_to_place.position = pos
			item_to_place.visible = true
			inv_ui.take_one(item_name)
			add_child(item_to_place)
		elif tiles.get(mouse_pos):
			tiles.erase(mouse_pos)
			inv_ui.put_one(item_name)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_inv_ui_item_in_mouse(item: String) -> void:
	item_name = item
	selected_item = dict.plate_nodes.get(item).instantiate()


func _on_frame_tile_map_layer_can_place(placable: bool) -> void:
	can_place = placable
