extends Resource

class_name Inv

@export var slots: Array[InvSlot]

func add_plates(plates: Array):
	print(plates[0])
	for item in plates:
		insert(ResourceLoader.load(item[0]) as InvPlate, item[1])

func insert(item: InvPlate, amount: int):
	var items_slots = slots.filter(func(slot): return slot.item == item)
	if !items_slots.is_empty():
		items_slots[0].amount += amount
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if !empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = amount
