extends CharacterBody2D

var shooting: bool = false

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	self.rotation += 5*delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		if visible and body.visible:
			Game.playerHP -= 1
			get_parent().reset_bullet(self)
