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
			print("Lets goo")
	pass
	
func toggle_bucket() -> void:
	if (bucket.visible):
		bucket.visible = false
		empty_bucket.visible = true
	else:
		bucket.visible = true
		empty_bucket.visible = false
	
func is_player(area: Area2D) -> bool:
	return area.get_parent().name == "player"
