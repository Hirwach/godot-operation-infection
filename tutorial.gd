extends Node2D

@onready var countdown: Timer = $WorldBorder/Countdown
var OutOfBound = false

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()

func spawn_mob():
	
	var new_mob = preload("res://white_cell.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf();
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob() 

func _on_player_health_depleted():
	%GameOver.visible = true
	Engine.time_scale = 0.1

func _on_world_border_out_of_bounds() -> void:
	if OutOfBound == false:
		%OutOfBoundsWarning.visible = true
		countdown.start()
		OutOfBound = true
	elif OutOfBound == true:
		%OutOfBoundsWarning.visible = false
		countdown.stop()
		OutOfBound = false

func _on_countdown_timeout() -> void:
	%GameOver.visible = true 
	Engine.time_scale = 0.1

func _on_restart_pressed() -> void:
	Engine.time_scale = 1
	%GameOver.visible = false 
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()
