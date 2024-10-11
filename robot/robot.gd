extends Area2D

enum Ray {LEFT = 90, RIGHT = -90, UP = -180, DOWN = 0}

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
var final_direction_idx := LVL_MOVEMENT.size() # for testing
var current_direction_idx: int = 0

const TILE_SIZE: int = 16
var current_direction := Vector2.DOWN
@onready var ray = $RayCast2D
var final_position := position + current_direction * TILE_SIZE
var start_movement := false
var can_move := true


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if start_movement and can_move:
		position = position.move_toward(final_position, 0.5)


func _on_timer_timeout() -> void:
	start_movement = true
	final_position = position + current_direction * TILE_SIZE
	ray.force_raycast_update()
	ray.set_target_position(current_direction * TILE_SIZE)
	#choose_next_direction()
	if ray.is_colliding():
			can_move = false
	

func choose_next_direction() -> void:
	current_direction = LVL_MOVEMENT[current_direction_idx]
	current_direction_idx += 1
	if current_direction_idx == final_direction_idx:
		current_direction_idx = 0
