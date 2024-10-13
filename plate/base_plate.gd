extends Area2D
class_name BasePlate

enum PlateType {NONE, ARROW}

@export var plate_type := PlateType.NONE
var can_rotate := false

# Use onready to load the Sprite2D and CollisionShape2D after they are initialized
@onready var sprite
@onready var collision_shape

func _ready():
	if sprite == null:
		print("Sprite2D node is not found!")

func _on_mouse_entered() -> void:
	print("Entered!")
	can_rotate = true

func _on_mouse_exited() -> void:
	print("Exited!")
	can_rotate = false
