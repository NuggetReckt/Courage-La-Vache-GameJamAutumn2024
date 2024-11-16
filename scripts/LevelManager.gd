extends Node2D

@onready var player_counter: Label = $PlayerCounter
@onready var day_timer: Timer = $DayTimer
var night : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day_timer.start()
	night = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#jour/nuit
	if(!night):
		find_child("hunter").black_hole.modulate = Color(1,1,1,0)
	else:
		find_child("hunter").black_hole.modulate = Color(1,1,1,1)
	
	#conditions de win
	if (Main.generator_charge_count >= 3):
		print("les vaches ont gagné !")
		get_tree().change_scene_to_file("res://scenes/CowWin.tscn")
	if (Main.players_alive_count <= 0):
		print("le chasseur à gagné !")
		get_tree().change_scene_to_file("res://scenes/HunterWin.tscn")
	
	player_counter.text = str(Main.players_alive_count)



func _on_day_timer_timeout() -> void:
	night = true
	pass # Replace with function body.
