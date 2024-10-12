class_name Plate extends Area2D


@onready var raycast = $RayCast2D
@onready var next_direction = (raycast.to_global(raycast.target_position) - raycast.to_global(Vector2.ZERO)).normalized()
var can_rotate := false


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and can_rotate:
			if not event.pressed:
				$RotateOrSelect.play()
				rotation_degrees += 90
				next_direction = (raycast.to_global(raycast.target_position) - raycast.to_global(Vector2.ZERO)).normalized()



func _on_area_entered(area: Area2D) -> void:
	area.current_direction = next_direction
	area.ray.set_target_position(area.current_direction * area.TILE_SIZE)


func _on_mouse_entered() -> void:
	can_rotate = true


func _on_mouse_exited() -> void:
	can_rotate = false
