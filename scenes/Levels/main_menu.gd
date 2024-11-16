extends Node2D

var sens : bool = true
var start: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(find_child("Sprite2D").rotation)
	if sens:
		find_child("Sprite2D").rotation +=(1*delta)
	else:
		find_child("Sprite2D").rotation -=(1*delta)
		
	if find_child("Sprite2D").rotation>0.3:
		sens=false
	if find_child("Sprite2D").rotation<-0.3:
		sens=true
	
	if start==true:
		if find_child("Sprite2D").scale.x+find_child("Sprite2D").scale.y<100:
			find_child("Sprite2D").scale +=Vector2(0.5*delta, 0.5*delta)
		
	if Input.is_anything_pressed():
		start = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/Levels/Tuto.tscn")	
	pass
