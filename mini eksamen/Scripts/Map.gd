extends Node2D

var in_out = 0

func _process(delta):
	visibility()
func visibility():
	if in_out == 0:
		$Area2D/Emne1.visible = false
	else:
		$Area2D/Emne1.visible = true
	if Global.level == 0:
		$Area2D2.visible = false
	else:
		$Area2D2.visible = true
func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		in_out += 1
		print(in_out)
func _on_Area2D_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		in_out -= 1
		print(in_out)
func _on_Teori1_pressed():
		get_tree().change_scene("res://Scenes/Pensum1.tscn")
func _on_Test1_pressed():
	Global.pensum_progress -= 1
	get_tree().change_scene("res://Scenes/Opgave_menu_1.tscn")


func _on_Area2D2_body_entered(body):
	if Global.level == 1 and body.name == "Player":
		get_tree().change_scene("res://Scenes/Map2.tscn")
