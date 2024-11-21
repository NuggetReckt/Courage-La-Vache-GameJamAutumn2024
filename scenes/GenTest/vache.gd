extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.visible = true
	$AnimatedSprite2D.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (randi()%5500==1):
		find_child("CPUParticles2D").emitting = true
		if(randi()%2 == 1):
			AudioManager.get_rand_mooh().play()
		await get_tree().create_timer(1.5).timeout
		find_child("CPUParticles2D").emitting = false
	if (randi()%8000==1):
		$Sprite2D.visible = false
		$AnimatedSprite2D.visible = true
		$AnimatedSprite2D.play("default")
		await get_tree().create_timer(1.2).timeout
		$Sprite2D.visible = true
		$AnimatedSprite2D.visible = false
	if(randi()%7000==1):
		$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
		$Sprite2D.flip_h = !$Sprite2D.flip_h
		
