extends KinematicBody2D

const JUMP_FORCE = -375
const DOWN_FORCE = 1000
const MAX_SPEED = 800
const GRAVITY = 8
const FALL_GRAVITY = 1000
const JUMP_REALESE_FORCE = -1000
const ACCELERATION = 30
const FRICTION = 30


var velocity = Vector2.ZERO



func Position_pensum():
	if Global.pensum_progress == 1:
		position.x = Global.x_1



#ganger ikke med velocity med delta, da det allerede er indbygget i funktionen 
func _physics_process(_delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#strength gør så man kan trykke "halvt" på en knap. det er en return value mellem -1,0,1, men nu også med -0,5 og 0,5
	
	if input.x == 0:
		apply_friction()
		$AnimatedSprite.animation = "Idle"
	else:
		apply_acceleration(input.x)
		$AnimatedSprite.animation = "Run"
		if input.x > 0:
			$AnimatedSprite.flip_h = false
		elif input.x < 0:
			$AnimatedSprite.flip_h = true
	
	if is_on_floor(): 
		if Input.is_action_pressed("jump"):
			velocity.y = JUMP_FORCE
			#$AnimatedSprite.animation = "Jump"
	#-y svarer til opad, is_on_floor sørger for man ikke kan hoppe som man vil. man kunne bruge "and"
		else:
			
			if Input.is_action_just_released("jump") and velocity.y < JUMP_REALESE_FORCE:
				velocity.y = JUMP_REALESE_FORCE
	#man kan lave nogle små hop, men det fikses med velocity.y < 0, da det er opad. ved at ændre 0 til andre værdier kan man stadig lave små hop til en hvis grænse
			if velocity.y > 0:
				velocity.y += FALL_GRAVITY
	#dette kode, gør så man falder hurtigere ned de positive tall er på vej ned, så man ikke gør det lige når man har noget makspunktet, 2. linje er det tal man lægger til gravity på vej ned
	else:
		$AnimatedSprite.animation = "Jump"
		
	var was_in_air = not is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	var just_landed = is_on_floor() and was_in_air
	
	if Input.is_action_pressed("down"):
		velocity.y = DOWN_FORCE
	Position_pensum()
func apply_gravity():
	velocity.y += GRAVITY
	#den linje over svarer til gravity
	
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)
	
	
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION)
	#move_toward går imod 0 som er værdierne fra overstående kode i forhold til movement i x-retningerne. amount er enten negativ eller positiv, og styres efter retning man går. 20 er accelerationskonstant
