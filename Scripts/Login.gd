extends Node2D

var content = "1"

func save(content):
	content = Global.content
	var file = File.new()
	file.open("Save_game.txt", File.WRITE)
	file.store_string(content)
	file.close()

func load_():
	var file = File.new()
	file.open("Save_game.txt", File.READ)
	content = file.get_as_text()
	Global.content = content 
	file.close()
	return content

func _on_Load_game_pressed():
	load_()
	print(content)

func _on_Save_game_pressed():
	save(content)
	print(content)
	print("Global:" + Global.content)

func _on_Annuler_pressed():
	get_tree().change_scene("res://Scenes/Hoved menu.tscn")
