extends Area2D
class_name BasePlate

enum PlateType {NONE, ARROW}

@export var plate_type := PlateType.NONE
var can_rotate := false


func _on_mouse_entered() -> void:
	can_rotate = true


func _on_mouse_exited() -> void:
	can_rotate = false
