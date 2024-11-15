extends Node2D

@onready var bucket: Sprite2D = $Bucket
@onready var empty_bucket: Sprite2D = $EmptyBucket

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bucket.visible = false
	empty_bucket.visible = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
func toggle_bucket(delta: float) -> void:
	if (bucket.visible):
		bucket.visible = false
		empty_bucket.visible = true
	else:
		bucket.visible = true
		empty_bucket.visible = false
