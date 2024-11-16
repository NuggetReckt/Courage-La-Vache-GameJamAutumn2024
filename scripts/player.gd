extends CharacterBody2D

@export var speed = 300.0
@export var id : int
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var death_timer: Timer = $Death_Timer
@onready var label: Label = $Label

var dead : bool

func _ready() -> void:
	z_index = -1
	dead = false

func _process(delta: float) -> void:
	if(dead):
		position.y -= speed * delta
		rotation += 0.01*speed*delta
		

func _physics_process(delta: float) -> void:
	
	if(dead):
		return
	
	if(!get_parent().night):
		#name
		label.text = "joueur " + str(id-1)
		#rotatation
		sprite.rotation += 0.01*speed*delta
		z_index = 3
		
		if(sprite.scale.x < 0.15):
			sprite.scale.x += 0.01*10*delta
			sprite.scale.y += 0.01*10*delta
		#elif(sprite.scale.x > 0.09 && sprite.scale.x < 0.1):
		#	sprite.scale.x -= 0.01*10*delta
		#	sprite.scale.y -= 0.01*10*delta

		return #bloque les controles
	else:
		if(label.text != ""):
			label.text = ""
			sprite.rotation = 0
			sprite.scale.x = 0.09
			sprite.scale.y = 0.09
			z_index = -1
	
	#print(name + " has id " + str(id))

	if id == 1: return #tt sauf le hunter

	#Movement globals
	var input_vector : Vector2 = Vector2.ZERO
	input_vector.x = Input.get_action_strength(str(id) + "_right") - Input.get_action_strength(str(id) + "_left")
	input_vector.y = Input.get_action_strength(str(id) + "_down") - Input.get_action_strength(str(id) + "_up")
	
	if input_vector:
		velocity = input_vector.normalized() * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	#flip le sprite
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	
	#animations
	if velocity != Vector2.ZERO:
		sprite.play()
	else:
		sprite.stop()
	
	if(Input.is_action_just_pressed(str(id) + "_reveal")):
		particles.emitting = true
		AudioManager.get_rand_mooh().play()
	else:
		particles.emitting = false
	
	move_and_slide()


func die():
	dead = true
	death_timer.start()
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	z_index = 3
	
func getId():
	return id

func _on_death_timer_timeout() -> void:
	Main.players_alive_count -= 1
	queue_free()
