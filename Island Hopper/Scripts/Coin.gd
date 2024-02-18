extends Area2D

@export var score: int

func _on_body_entered(body) -> void:
	GameData.score += score
	$AnimationPlayer.play("Pick_Up")
