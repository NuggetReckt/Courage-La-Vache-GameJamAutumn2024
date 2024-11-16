extends Node2D

@onready var bucket: Sprite2D = $Bucket
@onready var empty_bucket: Sprite2D = $EmptyBucket
@onready var area_2d: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bucket.visible = false
	empty_bucket.visible = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var overlapping_areas = area_2d.get_overlapping_areas()
	
	for area: Area2D in overlapping_areas:
		if (is_player(area)):
			var player: Node = area.get_parent()
		
			if (Input.is_action_just_pressed(str(player.getId()) + "_fill")):
				toggle_bucket()
	pass
	
func toggle_bucket() -> void:
	var fill_count: int = Main.get_bucket_fill_count()
	
	if (bucket.visible):
		bucket.visible = false
		empty_bucket.visible = true
	else:
		bucket.visible = true
		empty_bucket.visible = false
		Main.set_bucket_fill_count(fill_count + 1)

func is_player(area: Area2D) -> bool:
	return area.get_parent().name.contains("player")
