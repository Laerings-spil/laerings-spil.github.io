extends Node2D

var wrong1 = 0
var wrong2 = 0
var wrong3 = 0
var right = 0


func _process(delta):
	visibility()

func visibility():
	if wrong1 == 0:
		$LasseKnap2.visible = false
	else:
		$LasseKnap2.visible = true
	if wrong2 == 0:
		$LasseKnap4.visible = false
	else:
		$LasseKnap4.visible = true
	if wrong3 == 0:
		$LasseKnap7.visible = false
	else:
		$LasseKnap7.visible = true
	if right == 0:
		$Korrekt.visible = false
	else:
		$Korrekt.visible = true
	if right == 0:
		$Korrekt2.visible = false
	else:
		$Korrekt2.visible = true
func _on_Forkert_1_pressed():
	wrong1 += 1
func _on_Forkert_2_pressed():
	wrong2 += 1
func _on_Forkert_3_pressed():
	wrong3 += 1
func _on_Rigtig_pressed():
	right += 1
func _on_g_videre_pressed():
	Global.level += 1
	Global.content = "11"
	get_tree().change_scene("res://Scenes/Map.tscn")
