extends Node2D

var node = preload("res://scenes/VacheTest/Vache.tscn")
var tab : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(25):
		inst()
	pass # Replace with function body.

func inst():
	var instance = node.instantiate()
	if (randi()%2)==1:
		instance.find_child("Sprite2D").flip_h=true
	instance.position = Vector2(randi()%1050 + 50,randi()%550 + 50)
	add_child(instance)
	tab.append(instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	for i in tab:
		for j in tab:
			if i==j :
				continue
			while i.find_child("Area2D").overlaps_area(j.find_child("Area2D")) :
				remove_child(i)
				i.position = Vector2(randi()%1750 + 50,randi()%950 + 50)
				add_child(i)
	pass
