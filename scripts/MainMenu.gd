extends Control

func _on_Button_pressed():
	var transition = preload("res://scene/transition.tscn").instance()
	add_child(transition)

func transition_end():
	get_tree().change_scene("res://scene/Game.tscn")


func _on_Button2_pressed():
	get_tree().quit()
