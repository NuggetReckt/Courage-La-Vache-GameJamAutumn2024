extends CharacterBody2D

@export var speed = 300.0
@export var id : int = 1
@onready var area_2d: Area2D = $Area2D
#@onready var filter: Sprite2D = $filter
@onready var cooldown: Timer = $Cooldown

func _physics_process(delta: float) -> void:

	#print(name + " has id " + str(id))
	
	#if(!cooldown.is_stopped()):
	#	return
	
	if id != 1: return #au cas ou c pas le hunter mais pas possible

	#Movement globals
	var input_vector : Vector2 = Vector2.ZERO
	input_vector.x = Input.get_action_strength(str(id) + "_right") - Input.get_action_strength(str(id) + "_left")
	input_vector.y = Input.get_action_strength(str(id) + "_down") - Input.get_action_strength(str(id) + "_up")
	
	if input_vector:
		velocity = input_vector.normalized() * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()
	
	if(Input.is_action_just_pressed("1_find")):
		if(cooldown.is_stopped()):
			_find()
			cooldown.start()
		else:
			pass #feedback si find en cooldown ?

func _find():
	for area in area_2d.get_overlapping_areas():
		if(area.get_parent().name.contains("player")):
			area.get_parent().die()
			pass
