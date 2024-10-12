extends Area2D


const TILE_SIZE: int = 16
const TIMER_WAIT: int = 1
var current_direction := Vector2.DOWN
@onready var ray = $RayCast2D
@onready var final_position := position + current_direction * TILE_SIZE
var can_move := true
var start_movement := false
var pause := true

func _ready() -> void:
	pass
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("run"):
			if pause:
				pause = false
				$Timer.start(TIMER_WAIT)
			else:
				pause = true
				$Timer.stop()
			print("Pause: ", pause)


func _process(delta: float) -> void:
	if start_movement:
		position = position.move_toward(final_position, 0.5)
		if position == final_position:
			$Walking.play()
			$Timer.start(TIMER_WAIT)
			start_movement = false


func _on_timer_timeout() -> void:
	if not pause:
		if ray.is_colliding():
				print("Raycast colliding")
				#PlayDeathAnimation
				$Death.play()
				$Timer.stop()
				return
		get_final_position()
		
		
func get_final_position() -> void:
	final_position = position + current_direction * TILE_SIZE
	start_movement = true
