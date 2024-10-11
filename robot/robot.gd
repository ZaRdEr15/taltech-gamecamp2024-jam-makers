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
const LERP_WEIGHT: float = 0.5

var final_direction_idx := LVL_MOVEMENT.size()
var current_direction_idx: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var current_direction := LVL_MOVEMENT[current_direction_idx]
	position += current_direction * TILE_SIZE
	current_direction_idx += 1
	if current_direction_idx == final_direction_idx:
		current_direction_idx = 0


#lerp(position.y, position.y + TILE_SIZE * current_direction, 0.5)
