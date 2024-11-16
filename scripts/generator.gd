extends Node2D

@onready var empty_bucket: Sprite2D = $EmptyBucket
@onready var one_quarter_bucket: Sprite2D = $OneQuarterBucket
@onready var three_quarters_bucket: Sprite2D = $ThreeQuartersBucket
@onready var bucket: Sprite2D = $Bucket
@onready var area_2d: Area2D = $Area2D

@onready var BUCKET_SPRITES = {
	Main.BUCKET_STATE.EMPTY: empty_bucket,
	Main.BUCKET_STATE.ONE_QUARTER: one_quarter_bucket,
	Main.BUCKET_STATE.THREE_QUARTERS: three_quarters_bucket,
	Main.BUCKET_STATE.FULL: bucket
}

var time_held: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for sprite: Sprite2D in BUCKET_SPRITES.values():
		sprite.visible = false
	empty_bucket.visible = true
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
					toggle_bucket()
					time_held = 0
			else:
				time_held = 0
	pass
	
func toggle_bucket() -> void:
	var fill_count: int = Main.get_bucket_fill_count()
	var state: Main.BUCKET_STATE =  Main.get_bucket_state()
	var new_state: Main.BUCKET_STATE
	
	if (state + 1 >= Main.BUCKET_STATE.size()):
		new_state = 0
		Main.set_bucket_fill_count(fill_count + 1)
	else:
		new_state += 1
	
	BUCKET_SPRITES.get(state).visible = false
	BUCKET_SPRITES.get(new_state).visible = true
	
	Main.set_bucket_state(state)

func is_player(area: Area2D) -> bool:
	return area.get_parent().name.contains("player")
