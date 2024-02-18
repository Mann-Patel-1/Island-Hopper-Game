extends Area2D

func _on_body_entered(body) -> void:
	if owner.has_method("level_clear"):
		owner.level_clear()
