extends Node2D

var vache = preload("res://scenes/GenTest/Vache.tscn")

var tab : Array
var tabMur : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(20):
		inst()
		
	for child in get_parent().get_children():
		if child.name.contains("Mur"):
			tabMur.append(child)
	
	tabMur.append_array(tab)
	pass # Replace with function body.

func inst():
	var instanceV = vache.instantiate()
	if (randi()%2)==1:
		instanceV.find_child("Sprite2D").flip_h=true
		instanceV.find_child("AnimatedSprite2D").flip_h=true
	instanceV.position = Vector2(randi()%1050 + 50,randi()%550 + 50)
	add_child(instanceV)
	tab.append(instanceV)
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	for i in tab:
		for j in tabMur:
			if i==j :
				continue
			while i.find_child("Area2D").overlaps_area(j.find_child("Area2D")):
				remove_child(i)
				i.position = Vector2(randi()%1750 + 50,randi()%950 + 50)
				add_child(i)
	pass
