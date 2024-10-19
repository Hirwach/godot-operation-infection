extends Control

func _on_w_1_pressed() -> void:
	print("Weapon 1 selected")
	$".".visible = false
	Engine.time_scale = 1
	
func _on_w_2_pressed() -> void:
	print("Weapon 2 selected")
	$".".visible = false
	Engine.time_scale = 1
		
func _on_w_3_pressed() -> void:
	print("Weapon 3 selected")
	$".".visible = false
	Engine.time_scale = 1
	
