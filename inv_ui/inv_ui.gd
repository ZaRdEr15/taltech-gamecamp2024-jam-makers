extends Control

@onready var inv: Inv = preload("res://inv_ui/inventory/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
signal item_in_mouse

func _ready():
	update_slots()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
	
func insert_into_slots(new_items: Array):
	inv.add_plates(new_items)
	update_slots()
	
func take_one(item: String):
	inv.take_one(item)
	update_slots()
	
func not_empty(name: String):
	return inv.not_empty(name)

func select(item: String, index: int):
	item_in_mouse.emit(item)
	for i in range(slots.size()):
		if index != i:
			slots[i].unselect()

func _on_inv_ui_slot_take_item(item: String) -> void:
	select(item, 0)

func _on_inv_ui_slot_2_take_item(item: String) -> void:
	select(item, 1)

func _on_inv_ui_slot_3_take_item(item: String) -> void:
	select(item, 2)
