extends KinematicBody2D

const Speed = 2000
const Gravity = 500

var flip = 1
var Time_Facing = 0
var Can_Facing = true

var attack_flip = false


var Velocity = Vector2()

func _process(delta):
	_flip(delta)

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
	
	
	#Attack
	if $Ray_Attack.get_collider() != null and $Ray_Attack.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack2.get_collider() != null and $Ray_Attack2.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack3.get_collider() != null and $Ray_Attack3.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack4.get_collider() != null and $Ray_Attack4.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack5.get_collider() != null and $Ray_Attack5.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack6.get_collider() != null and $Ray_Attack6.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack7.get_collider() != null and $Ray_Attack7.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack8.get_collider() != null and $Ray_Attack8.get_collider().name == "Player":
		_attack()
	elif $Ray_Attack9.get_collider() != null and $Ray_Attack9.get_collider().name == "Player":
		_attack()
	else:
		$Attack_Area_Enemy_0_2/CollisionShape2D.disabled = true
		$Attack_Flip_Area_Enemy_0_2/CollisionShape2D.disabled = true
	
	
	
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
		attack_flip = true
	else:
		Velocity.x = -Speed * delta
		attack_flip = false

func _attack():
	if attack_flip:
		$Attack_Flip_Area_Enemy_0_2/CollisionShape2D.disabled = false
	else:
		$Attack_Area_Enemy_0_2/CollisionShape2D.disabled = false
