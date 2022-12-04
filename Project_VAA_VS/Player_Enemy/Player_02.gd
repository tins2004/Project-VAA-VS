extends KinematicBody2D

const Speed = 500
const Jump = 500
const Gravity = 500

var Facing_Right = true
var Velocity = Vector2()
var player_test = true

func _ready():
	pass

func _process(delta):
	_facing_right()
	

func _physics_process(delta):
	
	#Gravity
	Velocity.y += Gravity * delta
	if is_on_ceiling():
		Velocity.y += Gravity * 2/3
	
	
	#move control
	if Input.is_action_pressed("D"):
		Velocity.x = Speed
		Facing_Right = true
	elif Input.is_action_pressed("A"):
		Velocity.x = -Speed
		Facing_Right = false
	else:
		Velocity.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("W"):
			Velocity.y = -Jump
		else:
			Velocity.y = 0 
	
	
	
	move_and_slide(Velocity, Vector2.UP)

func _facing_right():
	if Facing_Right:
		scale.x = scale.y * 1
	else:
		scale.x = scale.y * -1


func _on_Add_Dame_area_entered(area):
	pass

func _on_Add_Dame_area_exited(area):
	pass



