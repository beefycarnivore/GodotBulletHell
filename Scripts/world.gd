extends Node2D

var timeSurvived: int = 0

func _ready() -> void:
	$Music.play()
func _on_timer_timeout() -> void:
	timeSurvived += 1
