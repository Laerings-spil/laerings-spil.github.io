extends Node2D

func _on_Start_pressed():
	if Global.content == "11":
		get_tree().change_scene("res://Source/Scenes/Map2.tscn")
	else:
		get_tree().change_scene("res://Source/Scenes/Map.tscn")
func _on_Login_pressed():
	get_tree().change_scene("res://Source/Scenes/Login.tscn")
