extends Node

enum BUCKET_STATE {EMPTY, ONE_QUARTER, THREE_QUARTERS, FULL}

var bucket_fill_count: int
var bucket_current_state: BUCKET_STATE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bucket_fill_count = 0
	bucket_current_state = BUCKET_STATE.EMPTY
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
	
func set_bucket_state(state: BUCKET_STATE) -> void:
	bucket_current_state = state
	
func get_bucket_state() -> BUCKET_STATE:
	return bucket_current_state
