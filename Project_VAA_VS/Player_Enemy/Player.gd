extends KinematicBody2D

const Speed = 500
const Jump = 500
const Gravity = 500

var Facing_Right = true
var Velocity = Vector2()
var player_test = true

var Add_Dame_Enemy_0_1 = false
var Add_Dame_Enemy_0_2 = false
var Add_Dame_Flip_Enemy_0_2 = false

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
	
	
	
	_add_dame_enemy_0_1()
	_add_dame_enemy_0_2()
	
	move_and_slide(Velocity, Vector2.UP)

func _facing_right():
	if Facing_Right:
		scale.x = scale.y * 1
	else:
		scale.x = scale.y * -1


func _on_Add_Dame_area_entered(area):
	if area.get_name() == 'Attack_Area_Enemy_0_1':
		Add_Dame_Enemy_0_1 = true
	elif area.get_name() == 'Attack_Area_Enemy_0_2':
		Add_Dame_Enemy_0_2 = true
	elif area.get_name() == 'Attack_Flip_Area_Enemy_0_2':
		Add_Dame_Flip_Enemy_0_2 = true

func _on_Add_Dame_area_exited(area):
	if area.get_name() == 'Attack_Area_Enemy_0_1':
		Add_Dame_Enemy_0_1 = false
	elif area.get_name() == 'Attack_Area_Enemy_0_2':
		Add_Dame_Enemy_0_2 = false
	elif area.get_name() == 'Attack_Flip_Area_Enemy_0_2':
		Add_Dame_Flip_Enemy_0_2 = false


#Enemy 0_1
func _add_dame_enemy_0_1():
	if Add_Dame_Enemy_0_1:
		Velocity.y = -700

#Enemy 0_2
func _add_dame_enemy_0_2():
	if Add_Dame_Enemy_0_2:
		Velocity.y = -350
		Velocity.x = -4000
	elif Add_Dame_Flip_Enemy_0_2:
		Velocity.y = -350
		Velocity.x = 4000


