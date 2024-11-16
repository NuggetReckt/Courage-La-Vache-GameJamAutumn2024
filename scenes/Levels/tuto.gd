extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Main.generator_charge_count >= 3):
		if (randi()%2==1):
			get_tree().change_scene_to_file("res://scenes/Lvl1.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/Lvl2.tscn")
	return
