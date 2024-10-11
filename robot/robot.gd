extends Area2D

# For testing
const LVL_MOVEMENT: Array[Vector2] = [
	Vector2.DOWN,
	Vector2.DOWN,
	Vector2.RIGHT,
	Vector2.RIGHT,
	Vector2.UP, 
	Vector2.UP,
	Vector2.LEFT,
	Vector2.LEFT,
]
const TILE_SIZE: int = 16
var final_direction_idx := LVL_MOVEMENT.size() # for testing
var current_direction_idx: int = 0
var current_direction: Vector2
var final_position := position + current_direction * TILE_SIZE


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	position = position.move_toward(final_position, 0.5)


func _on_timer_timeout() -> void:
	final_position = position + current_direction * TILE_SIZE
	choose_next_direction()
	

func choose_next_direction() -> void:
	current_direction = LVL_MOVEMENT[current_direction_idx]
	current_direction_idx += 1
	if current_direction_idx == final_direction_idx:
		current_direction_idx = 0
