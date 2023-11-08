extends CharacterBody2D
@export var speed: int = 35
@onready var animations = $AnimationPlayer
func get_input():
		var move_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		velocity = move_direction * speed
		

func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = 'down'
		if velocity.x < 0: direction = 'left'
		elif velocity.x > 0: direction = 'right'
		elif velocity.y < 0: direction = 'up'
		
		animations.play('walk_'+direction)
		
func _physics_process(delta):
	get_input()
	move_and_slide()
	updateAnimation()
