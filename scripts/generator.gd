extends Node2D

enum GENERATOR_STATE {EMPTY, ONE_QUARTER, THREE_QUARTERS, FULL}

@onready var empty_generator: Sprite2D = $EmptyBucket
@onready var one_quarter_generator: Sprite2D = $OneQuarterBucket
@onready var three_quarters_generator: Sprite2D = $ThreeQuartersBucket
@onready var generator: Sprite2D = $Bucket
@onready var area_2d: Area2D = $Area2D

@onready var GENERATOR_SPRITES = {
	GENERATOR_STATE.EMPTY: empty_generator,
	GENERATOR_STATE.ONE_QUARTER: one_quarter_generator,
	GENERATOR_STATE.THREE_QUARTERS: three_quarters_generator,
	GENERATOR_STATE.FULL: generator
}

var current_generator_state: GENERATOR_STATE
var time_held: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_generator_state = GENERATOR_STATE.EMPTY
	for sprite: Sprite2D in GENERATOR_SPRITES.values():
		sprite.visible = false
	empty_generator.visible = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var overlapping_areas = area_2d.get_overlapping_areas()
		
	for area: Area2D in overlapping_areas:
		if (is_player(area)):
			var player: Node = area.get_parent()
		
			if (Input.is_action_pressed(str(player.getId()) + "_fill")):
				time_held = time_held + 0.01
				if (time_held >= 2):
					time_held = 0
					if (get_current_generator_state() == GENERATOR_STATE.FULL):
						return
					toggle_generator()
			else:
				time_held = 0
	pass
	
func toggle_generator() -> void:
	var fill_count: int = Main.get_generator_charge_count()
	var state: GENERATOR_STATE = get_current_generator_state()
	var new_state: GENERATOR_STATE = state + 1
	
	if (new_state >= GENERATOR_STATE.size() - 1):
		Main.set_generator_charge_count(fill_count + 1)
	
	GENERATOR_SPRITES.get(state).visible = false
	GENERATOR_SPRITES.get(new_state).visible = true
	
	if (new_state == GENERATOR_STATE.FULL):
		AudioManager.generator_full.play()
	else:
		AudioManager.generator_fill.play()
	
	current_generator_state = new_state
	
func get_current_generator_state() -> GENERATOR_STATE:
	return current_generator_state

func is_player(area: Area2D) -> bool:
	return area.get_parent().name.contains("player")
