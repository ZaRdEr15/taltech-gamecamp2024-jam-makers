extends Area2D


const TILE_SIZE: int = 16
var current_direction := Vector2.DOWN
@onready var ray = $RayCast2D
@onready var final_position := position + current_direction * TILE_SIZE
var can_move := true
var start_movement := false
var pause := true

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if can_move and start_movement:
		position = position.move_toward(final_position, 0.5)
		if position == final_position:
			$Timer.start(1)
			start_movement = false


func _on_timer_timeout() -> void:
	if not pause:
		final_position = position + current_direction * TILE_SIZE
		ray.force_raycast_update()
		ray.set_target_position(current_direction * TILE_SIZE)
		#choose_next_direction()
		if ray.is_colliding():
				can_move = false
		start_movement = true
