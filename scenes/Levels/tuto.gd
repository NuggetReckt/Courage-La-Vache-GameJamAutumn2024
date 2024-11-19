extends Node2D

var night : bool = true
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	find_child("hunter").black_hole.modulate = Color(1,1,1,0.3)
	if (Main.moving_players.size() > 0 && Main.generator_charge_count >= Main.moving_players.size()):
		var lvlselect: int = randi()%3
		if (lvlselect==1):
			get_tree().change_scene_to_file("res://scenes/Levels/Lvl1.tscn")
		elif (lvlselect==2):
			get_tree().change_scene_to_file("res://scenes/Levels/Lvl2.tscn")
		else: 
			get_tree().change_scene_to_file("res://scenes/Levels/Lvl3.tscn")
	return
