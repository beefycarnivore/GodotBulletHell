extends CharacterBody2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	self.rotation += 5*delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("mob"):
		if body.isAlive and body.visible and self.visible:
			body.reset_mob(body)
			get_parent().reset_bullet(self)
