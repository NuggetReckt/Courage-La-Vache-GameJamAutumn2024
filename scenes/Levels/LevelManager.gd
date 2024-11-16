extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Main.generator_charge_count >= 3):
		print("les vaches ont gagné !")
		get_tree().change_scene_to_file("res://scenes/CowWin.tscn")
		return
	if (Main.players_alive_count <= 0):
		print("le chasseur à gagné !")
		get_tree().change_scene_to_file("res://scenes/HunterWin.tscn")
		return
