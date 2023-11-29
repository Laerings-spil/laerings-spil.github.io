extends Node2D


func _on_Button2_pressed():
	get_tree().change_scene("res://Source/Scenes/Pensum1.tscn")

func _on_Button3_pressed():
	Global.pensum_progress += 1
	get_tree().change_scene("res://Source/Scenes/Map.tscn")
	
