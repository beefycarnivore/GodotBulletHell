extends Label

var timeSurvived: float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timeSurvived += 1*delta
	self.text = "Time Survived: " + str(snapped(timeSurvived, .01))
	print("Time Survived: ", snapped(timeSurvived, .01))


func _on_timer_timeout() -> void:
	pass # Replace with function body.
