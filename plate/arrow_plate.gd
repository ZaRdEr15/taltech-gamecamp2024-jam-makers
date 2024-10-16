extends BasePlate
class_name ArrowPlate

@onready var raycast = $RayCast2D
@onready var next_direction = (raycast.to_global(raycast.target_position) - raycast.to_global(Vector2.ZERO)).normalized()

@export var new_sprite_texture: Texture2D
@onready var child_sprite = $ChildSprite2D
signal remove_tile

func _ready():
	#new_sprite_texture = load("res://assets/plate.png")
	if sprite != null:
		sprite.texture = new_sprite_texture
		child_sprite.texture = new_sprite_texture

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("right_click"):
			if can_rotate:
				$RotateOrSelect.play()
				rotation_degrees += 90
				next_direction = (raycast.to_global(raycast.target_position) - raycast.to_global(Vector2.ZERO)).normalized()
		elif Input.is_action_just_pressed("click"):
			if can_rotate:
				remove_tile.emit(position)
				self.queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Robot":
		area.current_direction = next_direction
		area.ray.set_target_position(area.current_direction * area.TILE_SIZE)
