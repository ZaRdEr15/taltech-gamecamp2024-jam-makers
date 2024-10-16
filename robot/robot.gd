extends Area2D


@onready var ray = $RayCast2D
@onready var ray_starter_target = ray.target_position
@onready var final_position := position + current_direction * TILE_SIZE
@onready var starting_pos := position
@export var move_speed: float = 80.5


const TILE_SIZE: int = 16
const TIMER_WAIT: int = 0.01


var starting_direction := Vector2.DOWN
var current_direction := starting_direction

var can_move := true
var start_movement := false
var pause := true
var death := false
var level_complete := false
	
	
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
			$Animation.flip_h = false
			$WalkingSound.play()
			if not level_complete:
				$Timer.start(TIMER_WAIT)
			start_movement = false
	else:
		if not death and not level_complete:
			$Animation.play("idle")
		else:
			if not $Animation.is_playing():
				death = false
				ray.target_position = ray_starter_target
				position = starting_pos
				current_direction = starting_direction
				pause = true
				level_complete = false


func _on_timer_timeout() -> void:
	if not pause:
		if ray.is_colliding():
				$Animation.play("death")
				$DeathSound.play()
				$Timer.stop()
				death = true
				return
		get_final_position()
		match current_direction:
			Vector2.DOWN:
				$Animation.play("walking_down")
			Vector2.UP:
				$Animation.play("walking_up")
			Vector2.LEFT:
				$Animation.play("walking_side")
				$Animation.flip_h = true
			Vector2.RIGHT:
				$Animation.play("walking_side")
		
		
func get_final_position() -> void:
	final_position = position + current_direction * TILE_SIZE
	start_movement = true
	
	
func prepare_for_next_level() -> void:
	$LevelCompleteSound.play()
	$Timer.stop()
	$Animation.play("level_done")
	level_complete = true
	

func _on_animation_animation_finished() -> void:
	if $Animation.animation == "level_done":
		can_move = true
		current_direction = starting_direction


func _on_go_button_pressed() -> void:
	if pause:
		pause = false
		$Timer.start(TIMER_WAIT)
	else:
		pause = true
		$Timer.stop()
