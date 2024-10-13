extends Panel

@export var item_name: String
@onready var slot_visual: Sprite2D = $slot
@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label
signal take_item

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		item_name = slot.item.name
		amount_text.visible = true
		amount_text.text = str(slot.amount)


func _on_area_2d_mouse_entered() -> void:
	if item_visual.texture:
		make_dim()

func _on_area_2d_mouse_exited() -> void:
	if item_visual.texture:
		item_visual.modulate = Color(1, 1, 1, 1)  # Reset the sprite

func make_dim():
	item_visual.modulate = Color(0.8, 0.8, 0.8, 1) 
	
func unselect():
	$Sprite2D.visible = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click") and item_visual.texture:
		$Sprite2D.visible = true
		take_item.emit(item_name)
