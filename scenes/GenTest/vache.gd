extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (randi()%5000==1):
		find_child("CPUParticles2D").emitting = true
		await get_tree().create_timer(1.5).timeout
		find_child("CPUParticles2D").emitting = false
