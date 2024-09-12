extends CharacterBody2D

var speed: int = 25
var isAlive: bool = true
var mob: bool = true
var health: int = 5
@onready var player: Node = get_node("../../Player")
@onready var sprite: Sprite2D = get_node("GuardianSerpentOld")
@onready var bar: ProgressBar = get_node("ProgressBar")
@onready var anim: AnimatedSprite2D = get_node("Anim")
@onready var bullet_pool: Node = get_node("Bullets")
func _ready() -> void:
	get_node("CollisionShape2D").disabled = true
	bar.max_value = health


func _physics_process(delta: float) -> void:
	if isAlive:
		get_node("CollisionShape2D").disabled = false
		bar.value = health
		var direction: Vector2 = (player.global_position - self.global_position).normalized()
		velocity = speed * direction
		
		
		if direction.x < 0:
			sprite.flip_h = false
			get_node("Spawn Point").position = Vector2(-10, -11)
		else:
			sprite.flip_h = true
			get_node("Spawn Point").position = Vector2(10, -11)
		anim.hide()
		sprite.show()
		move_and_slide()
	
	else:
		anim.show()
		sprite.hide()
		get_node("CollisionShape2D").disabled = true
		bar.hide()
		
			

func reset_mob(body: Node)-> void:
	if health > 1:
		health -= 1
	else:
		isAlive = false
		anim.play("Death")
		await anim.animation_finished
		get_parent().reset_mob(body)
		Game.score += 1


func _on_player_detection_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		if visible and body.visible:
			Game.playerHP -= 1
			



func shoot_bullet()-> void:
	if self.visible:
		var bullet: Node = bullet_pool.get_bullet()
		var direction: Vector2 = (player.global_position - self.global_position).normalized()
		bullet.global_position = get_node("Spawn Point").global_position
		bullet.velocity = direction *100
		bullet.show()

func _on_shoot_bullet_timeout() -> void:
	shoot_bullet()
	
