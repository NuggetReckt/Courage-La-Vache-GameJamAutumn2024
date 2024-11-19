extends Node

var generator_charge_count: int
var players_alive_count: int
var moving_player_count: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generator_charge_count = 0
	players_alive_count = 3
	moving_player_count = 0
	pass # Replace with function body.
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_generator_charge_count(count: int) -> void:
	generator_charge_count = count

func get_generator_charge_count() -> int:
	return generator_charge_count
