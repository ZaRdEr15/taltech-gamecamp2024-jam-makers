extends Area2D
class_name BasePlate


@export var plate_type := 'Blank'
var can_rotate := false

# Use onready to load the Sprite2D and CollisionShape2D after they are initialized
@onready var sprite
@onready var collision_shape

func _on_mouse_entered() -> void:
	can_rotate = true

func _on_mouse_exited() -> void:
	can_rotate = false
