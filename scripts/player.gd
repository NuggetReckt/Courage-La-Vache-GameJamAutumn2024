extends CharacterBody2D

@export var speed = 300.0
@export var id : int

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_vector : Vector2 = Vector2.ZERO
	input_vector.x = Input.get_action_strength(str(id) + "_right") - Input.get_action_strength(str(id) + "_left")
	input_vector.y = Input.get_action_strength(str(id) + "_down") - Input.get_action_strength(str(id) + "_up")
		
	if input_vector:
		velocity = input_vector.normalized() * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
