extends Node2D

@onready var highScore: Label = get_node("HighScore")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highScore.text = "Your High Score is: " + str(Game.score)
	$Start.play()
	$CanvasLayer/VBoxContainer/Retry.grab_focus()

func _on_retry_pressed() -> void:
	Game.playerHP = 10
	Game.score = 0
	
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_retry_mouse_entered() -> void:
	$Blip.play()
	


func _on_quit_mouse_entered() -> void:
	$Blip.play()
	


func _on_retry_focus_entered() -> void:
	$Blip.play()


func _on_quit_focus_entered() -> void:
	$Blip.play()
