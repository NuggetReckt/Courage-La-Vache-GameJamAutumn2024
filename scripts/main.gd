extends Node

var bucket_fill_count: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bucket_fill_count = 0
	pass # Replace with function body.
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_bucket_fill_count(count: int) -> void:
	bucket_fill_count = count

func get_bucket_fill_count() -> int:
	return bucket_fill_count
