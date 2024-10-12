extends Control

@onready var inv: Inv = preload("res://inv_ui/inventory/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	update_slots()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
	
func insert_into_slots(new_items: Array):
	inv.add_plates(new_items)
	update_slots()
