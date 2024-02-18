extends Control

@export var startLevel = preload("res://Scenes/Level_Maker.tscn") as PackedScene
@onready var menu = $MarginContainer/Menu
@onready var options = $Options
@onready var video = $Video
@onready var audio = $Audio

func _process(delta):
	pass
	
func show_and_hide(first, second):
	first.show()
	second.hide()

func toggle_fullscreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

#The main menu screen buttons
func _on_start_game_button_pressed():
	get_tree().change_scene_to_packed(startLevel)

func _on_options_game_button_pressed():
	show_and_hide(options, menu)

func _on_quit_game_button_pressed():
	get_tree().quit()


#Options Screen form Menu Screen
func _on_video_pressed():
	show_and_hide(video, options)

func _on_audio_pressed():
	show_and_hide(audio, options)

func _on_backfromoptions_pressed():
	show_and_hide(menu, options)


#Video Screen form Options Screen
func _on_fullscreen_check_toggled(toggled_on):
	toggle_fullscreen()

func _on_v_sync_check_toggled(toggled_on):
	var window_id = 0 # Default ID for the main window
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func _on_backfromvideo_pressed():
	show_and_hide(options, video)


#Audio Screen form Options Screen
func _on_master_value_changed(value):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_music_value_changed(value):
	volume(2, value)

func _on_sound_fx_value_changed(value):
	volume(2, value)

func _on_backfromaudio_pressed():
	show_and_hide(options, audio)
