extends Node2D

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
	spawn_mob() # Replace with function body.


func _on_player_health_depleted():
	%GameOver.visible = true # Replace with function body.
	get_tree().paused = true
