extends Control

@export var startLevel = preload("res://Scenes/Level_Maker.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_quit_game_button_pressed():
	get_tree().quit()


func _on_restart_game_button_pressed():
	get_tree().change_scene_to_packed(startLevel)
