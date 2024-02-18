extends MarginContainer


func _ready() -> void:
	GameData.connect("score_updated", set_score_value)
	set_score_value(GameData.score)

func set_score_value(value: int) -> void:
	$"HBoxContainer/Score Value".text = "%03d" %value
