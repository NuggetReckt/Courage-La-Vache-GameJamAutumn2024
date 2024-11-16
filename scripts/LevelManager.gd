extends Node2D

@onready var player_counter: Label = $PlayerCounter

var phase : int #0 = jour / 1 = nuit (lmao cheh corto g la flm de faire une enum)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Main.generator_charge_count >= 3):
		print("les vaches ont gagné !")
		get_tree().change_scene_to_file("res://scenes/CowWin.tscn")
	if (Main.players_alive_count <= 0):
		print("le chasseur à gagné !")
		get_tree().change_scene_to_file("res://scenes/HunterWin.tscn")
	
	player_counter.text = str(Main.players_alive_count)
