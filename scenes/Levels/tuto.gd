extends Node2D

var night : bool = true
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	find_child("hunter").black_hole.modulate = Color(1,1,1,0.5)
	if (Main.generator_charge_count >= 2):
		if (randi()%2==1):
			get_tree().change_scene_to_file("res://scenes/Levels/Lvl1.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/Levels/Lvl2.tscn")
	return
