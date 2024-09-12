extends Node2D

var mob_scene: PackedScene = preload("res://Scenes/AI/snake_mob.tscn")
var pool_size: int = 10
var mob_pool: Array = []

@onready var timer: Timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(pool_size):
		var mob: Node2D = mob_scene.instantiate()
		mob.hide()
		mob_pool.append(mob)
		add_child(mob)


	
func get_mob()-> Node2D:
	for mob in mob_pool:
		if not mob.visible:
				return mob
	
	var new_mob: Node2D = mob_scene.instantiate()
	new_mob.hide()
	mob_pool.append(new_mob)
	add_child(new_mob)
	return new_mob
	
func reset_mob(mob: Node)-> void:
	mob.global_position = Vector2(-2000, -2000)
	mob.get_node("CollisionShape2D").disabled = false
	mob.isAlive = false
	mob.hide()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (get_parent().timeSurvived <= 9) and (get_parent().timeSurvived > 1):
		timer.wait_time = 10 - roundi(get_parent().timeSurvived/2)
		print("Wait time: ", timer.wait_time)

func _on_timer_timeout() -> void:
	var mobTemp: Node = get_mob()
	var randX: int = randi_range(-50,50)
	var randY: int = randi_range(-50,50)
	mobTemp.global_position = self.global_position + Vector2(randX, randY)
	mobTemp.show()
