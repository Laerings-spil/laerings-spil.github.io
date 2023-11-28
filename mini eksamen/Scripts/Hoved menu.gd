extends Node2D



func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Map.tscn")


func _on_Login_pressed():
	get_tree().change_scene("res://Scenes/Login.tscn")
