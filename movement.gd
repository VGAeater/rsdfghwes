extends CharacterBody2D

@export var speed = 10000

func get_input(delta):
	velocity = Input.get_vector("Left", "Right", "Up", "Down") * speed * delta
	
	if velocity.length() > 0:
		$AnimatedSprite2D.play('walking')
	else:
		$AnimatedSprite2D.play('standing')
	
	if abs(velocity.x) > 0: 
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	#velocity = Vector2(0, 0);
	#if Input.is_action_pressed("Left"):
	#	velocity.x -= speed*delta
	#if Input.is_action_pressed("Right"):
	#	velocity.x += speed*delta

func _physics_process(delta):
	get_input(delta)
	move_and_slide()
