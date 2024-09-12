extends Node2D

@onready var finalScore: Label = get_node("Score")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finalScore.text = "Your Final Score is: " + str(Game.score)



func _on_retry_pressed() -> void:
	Game.playerHP = 10
	Game.score = 0
	
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
