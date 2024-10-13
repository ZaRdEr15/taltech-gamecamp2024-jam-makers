extends Resource

class_name Inv

@export var slots: Array[InvSlot]

func add_plates(plates: Array):
	for item in plates:
		insert(ResourceLoader.load(item[0]) as InvPlate, item[1])

func take_one(item: String):
	var inv_item = ResourceLoader.load(PlateDict.inv_items.get(item)) as InvPlate
	var items_slots = slots.filter(func(slot): return slot.item == inv_item)
	if !items_slots.is_empty() and items_slots[0].amount != 0:
		items_slots[0].amount -= 1

func insert(item: InvPlate, amount: int):
	var items_slots = slots.filter(func(slot): return slot.item == item)
	if !items_slots.is_empty():
		items_slots[0].amount += amount
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if !empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = amount
