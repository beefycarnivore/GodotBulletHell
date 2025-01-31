extends Node

var bullet_scene: PackedScene = preload("res://Scenes/AI/AIbullet.tscn")
var pool_size: int = 10
var bullet_pool: Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(pool_size):
		var bullet: Node = bullet_scene.instantiate()
		bullet.hide()
		bullet_pool.append(bullet)
		add_child(bullet)
	
func get_bullet()-> Node:
	for bullet in bullet_pool:
		if not bullet.visible:
				return bullet
	
	var new_bullet: Node = bullet_scene.instantiate()
	new_bullet.hide()
	bullet_pool.append(new_bullet)
	add_child(new_bullet)
	return new_bullet
	
func reset_bullet(bullet: Node)-> void:
	bullet.global_position = Vector2(-10000, -10000)
	bullet.hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
