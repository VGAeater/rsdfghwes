extends Camera2D

@export var speed = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = self.position.lerp($"../player".position, 1 - pow(0.05, delta))
	
