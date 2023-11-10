extends CharacterBody2D

@export var speed = 35
@export var limit = 0.5
@export var endPoint: Marker2D

@onready var animations = $AnimatedSprite2D


var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position

func updateAnimation():
	var animation = 'walk_up'
	if velocity.y > 0:
		animation = 'walk_down'
	elif velocity.x < 0 and velocity.y == 0:
		animation = 'walk_left'
	elif velocity.x > 0 and velocity.y == 0:
		animation = 'walk_right'
	animations.play(animation)

func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd
func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
	velocity = moveDirection.normalized()*speed

func _physics_process(delta):
	updateVelocity()
	updateAnimation()
	move_and_slide()
