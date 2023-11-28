extends Node2D

var test = 1
var content = 0


func save(content):
	var file = File.new()
	file.open("Save_game.txt", File.WRITE)
	file.store_string(content)
	file.close()
	print(content)
func load_():
	var file = File.new()
	file.open("Save_game.txt", File.READ)
	content = file.get_as_text()
	print(content)
	file.close()
	return content

func reset_content():
	content = "1"



func _on_Load_game_pressed():
	load_()

func _on_Button_pressed():
	content + "1"
	print(test)

func _on_Save_game_pressed():	
	save(content + "1")
	print(content)
	Global.content == content

func _on_reset_pressed():
	reset_content()
	print(content)


func _on_Annuler_pressed():
	get_tree().change_scene("res://Scenes/Hoved menu.tscn")
