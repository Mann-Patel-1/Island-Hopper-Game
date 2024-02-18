extends Area2D
 
func _on_body_entered(body) -> void:
	
	if body.has_method("die"):
		body.die()
