extends Node2D

var mouse_input = 'none'
@onready var plateArray = $PlateArray
@export var inv: Inv

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#print("Click")
			mouse_input = "click"
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			print("Wheel up")
			mouse_input = "wheel up"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_input == "click":
		print($TileMapLayer2.local_to_map(get_local_mouse_position()))
		var pos = $TileMapLayer2.map_to_local($TileMapLayer2.local_to_map(get_local_mouse_position()))
		print(pos)
		plateArray.plateArray[0].position = pos
		plateArray.plateArray[0].visible = true
		mouse_input = 'none'
	
	
