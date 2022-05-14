extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func failure():
	visible = true
	Global.lore = 0
	Global.firstTime = true
	Global.livingExpense = 40
	Global.extraliving = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://scene/MainMenu.tscn")
