extends KinematicBody2D

const Speed = 1300
const Gravity = 500

var flip = 1
var Time_Facing = 0
var Can_Facing = true

var Time_Attack = 0
var Start_Attack = false


var Velocity = Vector2()

func _process(delta):
	_flip(delta)
	_attack(delta)

func _physics_process(delta):
	
	Velocity.y += Gravity * delta
	
	#flip
	scale.x = scale.y * flip
	
	if $Ray_Player_Left.get_collider() != null and $Ray_Player_Left.get_collider().name == "Player":
		Can_Facing = true
	elif $Ray_Player_Left2.get_collider() != null and $Ray_Player_Left2.get_collider().name == "Player":
		Can_Facing = true
	elif $Ray_Player_Left3.get_collider() != null and $Ray_Player_Left3.get_collider().name == "Player":
		Can_Facing = true
	else:
		Can_Facing = false
		Time_Facing = 0
	
	#move
	if $Ray_Player.get_collider() != null and $Ray_Player.get_collider().name == "Player":
		_move(delta)
	elif $Ray_Player2.get_collider() != null and $Ray_Player2.get_collider().name == "Player":
		_move(delta)
	elif $Ray_Player3.get_collider() != null and $Ray_Player3.get_collider().name == "Player":
		_move(delta)
	else:
		Velocity.x = 0
	
	
	#attack
	if $Ray_Attack.get_collider() != null and $Ray_Attack.get_collider().name == "Player":
		Start_Attack = true
	elif $Ray_Attack2.get_collider() != null and $Ray_Attack2.get_collider().name == "Player":
		Start_Attack = true
	elif $Ray_Attack3.get_collider() != null and $Ray_Attack3.get_collider().name == "Player":
		Start_Attack = true
	else:
		Start_Attack = false
		Time_Attack = 0
		$Attack_Area_Enemy_0_1/CollisionShape2D.disabled = true
	
	
	
	move_and_slide(Velocity, Vector2.UP)

func _flip(delta):
	if Can_Facing:
		Time_Facing += delta
	var secs = fmod(Time_Facing,60)
	
	if secs > 1:
		flip *= -1
		Time_Facing = 0
	
func _move(delta):
	if flip == 1:
		Velocity.x = Speed * delta
	else:
		Velocity.x = -Speed * delta

func _attack(delta):
	if Start_Attack:
		Time_Attack += delta
	var secs = fmod(Time_Attack,60)
	
	if secs > 1:
		$Attack_Area_Enemy_0_1/CollisionShape2D.disabled = false
		Time_Attack = 0


