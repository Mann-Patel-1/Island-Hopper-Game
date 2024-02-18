extends Node2D
 
@export_file var next_level
 
 
func level_clear() -> void:
	$"Transition Layer/AnimationPlayer".play("fade_out")
	await $"Transition Layer/AnimationPlayer".animation_finished
	get_tree().change_scene_to_file(next_level)
