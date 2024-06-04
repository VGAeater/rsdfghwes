extends Area2D

@export var startSpeed = 400
var speed = 0

var direction = 0

var time_start = 0

func _ready():
	time_start = Time.get_ticks_msec()

func pointToPlayer():
	var tempAngle = randf_range(0, PI*2)
	var mag = (get_viewport_rect().size/2).length() + randi_range(0,500)
	position = $"../../player".position + Vector2(cos(tempAngle), sin(tempAngle))*mag
	direction = tempAngle + PI

func _physics_process(delta):
	if (get_viewport_rect().size/2).length() < $"../../player".position.distance_to(self.position):
		pointToPlayer()
	
	var linear_velocity
	speed = startSpeed + (Time.get_ticks_msec() - time_start)/100
	var deltaSpeed = speed * delta
	
	linear_velocity = Vector2(cos(direction), sin(direction)) * deltaSpeed
	
	if linear_velocity.length() > 0:
		$AnimatedSprite2D.play('walking')
	else:
		$AnimatedSprite2D.play('standing')
	
	if abs(linear_velocity.x) > 0: 
		$AnimatedSprite2D.flip_h = linear_velocity.x < 0
	
	self.position += linear_velocity

func _on_body_entered(body):
	print("hi")
	get_tree().quit()
