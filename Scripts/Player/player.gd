extends CharacterBody2D

var speed: int = 75
var direction: Vector2 = Vector2(0,1)
var bulletRate: int = 30 #firing rate in bullets per minute
@onready var bullet_pool = get_node("Bullets")
@onready var timer: Timer = get_node("Timer")
@onready var music = $"../Music"
func _physics_process(delta: float) -> void:
	var inputDir: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")).normalized()
		
	if inputDir.x > 0:
		#check if player is moving right
		get_node("Player").frame = 0
		get_node("Player").flip_h = false
		direction = inputDir
	elif inputDir.x < 0:
		#check if player is moving left
		get_node("Player").frame = 0
		get_node("Player").flip_h = true
		direction = inputDir
	elif inputDir.y > 0:
		#check if player is moving up
		get_node("Player").frame = 2
		get_node("Player").flip_h = false
		direction = inputDir
	elif inputDir.y < 0:
		#check if player is moving down
		get_node("Player").frame = 3
		get_node("Player").flip_h = false
		direction = inputDir
		
	get_node("Spawn Point").position = direction*10
	
	#if Input.is_action_just_pressed("Shoot"):
	#	var bulletTemp: Node = bullet_pool.get_bullet()
	#	bulletTemp.global_position = get_node("Spawn Point").global_position
	#	bulletTemp.velocity = direction *100
	#	bulletTemp.show()
		
	velocity = inputDir * speed
	move_and_slide()
	if Game.playerHP < 1:
		music.stop()
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		
	
		


func _on_timer_timeout() -> void:
		var bulletTemp: Node = bullet_pool.get_bullet()
		bulletTemp.global_position = get_node("Spawn Point").global_position
		bulletTemp.velocity = direction *100
		bulletTemp.show()
		#$Pewpew.play()


#func _on_its_hopeless_finished() -> void:
	
