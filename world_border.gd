extends Area2D
signal out_of_bounds


func _on_body_entered(body: Node2D) -> void:
	print("world border reached")
	out_of_bounds.emit()


func _on_body_exited(body: Node2D) -> void:
	print("world border left")
	out_of_bounds.emit()
