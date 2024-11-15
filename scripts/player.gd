extends CharacterBody2D

@export var speed = 300.0
@export var id : int
@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:

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
	
	if(Input.is_action_pressed(str(id) + "_reveal")):
		print("revealing")
		z_index = 1
	else:
		z_index = -1
	
	move_and_slide()


func die():
	#faire un feedback de mort
	queue_free()
	pass

func getId():
	return id
