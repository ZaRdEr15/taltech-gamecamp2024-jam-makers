extends Area2D


@onready var ray = $RayCast2D
@onready var final_position := position + current_direction * TILE_SIZE
@onready var starting_pos := position
@export var move_speed: float = 25.0


const TILE_SIZE: int = 16
const TIMER_WAIT: int = 1


var starting_direction := Vector2.DOWN
var current_direction := starting_direction
var can_move := true
var start_movement := false
var pause := true
var death := false
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("run"):
			if pause:
				pause = false
				$Timer.start(TIMER_WAIT)
			else:
				pause = true
				$Timer.stop()


func _process(delta: float) -> void:
	if start_movement:
		position = position.move_toward(final_position, move_speed * delta)
		if position == final_position:
			$WalkingSound.play()
			$Timer.start(TIMER_WAIT)
			start_movement = false
	else:
		if not death:
			$Animation.play("idle")
		else:
			if not $Animation.is_playing():
				death = false
				position = starting_pos
				current_direction = starting_direction
				pause = true


func _on_timer_timeout() -> void:
	if not pause:
		if ray.is_colliding():
				$Animation.play("death")
				$DeathSound.play()
				$Timer.stop()
				death = true
				return
		get_final_position()
		$Animation.play("walking")
		
		
func get_final_position() -> void:
	final_position = position + current_direction * TILE_SIZE
	start_movement = true
