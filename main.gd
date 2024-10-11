extends Node2D

@onready var plate = preload("res://plate.tscn")
var event = 'none'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Click ", event.position)
			event = "click"
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			print("Wheel up")
			event = "wheel up"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if event == "click":
		var pos = $TileMapLayer2.map_to_local(
			$TileMapLayer2.local_to_map(get_local_mouse_position()))
		plate.instantiate()
	
	
	
