extends Node

var generator_charge_count: int
var players_alive_count: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generator_charge_count = 0
	players_alive_count = 2
	pass # Replace with function body.
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (generator_charge_count >= 3):
		print("les vaches ont gagné !")
		return
	if (players_alive_count <= 0):
		print("le chasseur à gagné !")
		return
	pass
	
func set_generator_charge_count(count: int) -> void:
	generator_charge_count = count

func get_generator_charge_count() -> int:
	return generator_charge_count
