extends Node2D

var in_out = 0

func _process(delta):
	visibility()
	
func visibility():
	if in_out == 0:
		$Emne2.visible = false
	else:
		$Emne2.visible = true

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Slutning.tscn")

func _on_Area2D2_body_entered(body):
	if body.name == "Player":
		in_out += 1

func _on_Area2D2_body_exited(body):
	if body.name == "Player":
		in_out -= 1
