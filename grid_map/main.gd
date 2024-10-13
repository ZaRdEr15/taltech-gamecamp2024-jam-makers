extends Node2D

var mouse_input = 'none'
@export var items = [["Back", 2], ["Arrow", 5]]
@onready var inv_ui = $CanvasLayer/Inv_UI
var dict = PlateDict
@export var item_name: String
@export var selected_item: BasePlate
@export var item_to_place: BasePlate
var can_place: bool = false

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
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			print("Wheel up")
			mouse_input = "wheel up"

func select():
	if selected_item and can_place and inv_ui.not_empty(item_name):
		item_to_place = selected_item.duplicate()
		var mouse_pos = $FrameTileMapLayer.local_to_map(get_local_mouse_position())
		if $TileMapLayer.get_cell_tile_data(mouse_pos):
			print(item_to_place)
			var pos = $FrameTileMapLayer.map_to_local(mouse_pos)
			item_to_place.position = pos
			item_to_place.visible = true
			inv_ui.take_one(item_name)
			add_child(item_to_place)
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_inv_ui_item_in_mouse(item: String) -> void:
	item_name = item
	selected_item = dict.plate_nodes.get(item).instantiate()
	print(typeof(selected_item))


func _on_frame_tile_map_layer_can_place(placable: bool) -> void:
	can_place = placable
