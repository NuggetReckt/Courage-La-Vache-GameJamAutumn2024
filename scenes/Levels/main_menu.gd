extends Node2D

var sens : bool = true
var start: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Main.generator_charge_count = 0
	Main.players_alive_count = 3
	AudioManager.menu_theme.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(find_child("Sprite2D").rotation)
	if sens:
		find_child("Sprite2D").rotation +=0.01
	else:
		find_child("Sprite2D").rotation -=0.01
		
	if find_child("Sprite2D").rotation>0.3:
		sens=false
	if find_child("Sprite2D").rotation<-0.3:
		sens=true
	
	if start==true:
		if find_child("Sprite2D").scale.x+find_child("Sprite2D").scale.y<100:
			find_child("Sprite2D").scale +=Vector2(0.01, 0.01)
		
	if Input.is_anything_pressed():
		start = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/Levels/Tuto.tscn")	
	pass
