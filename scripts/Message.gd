extends Node2D

var btnFunction = 0

func _ready():
	pass # Replace with function body.


func message(title, body, function):
	visible = true
	$message.text = body
	$title.text = title
	btnFunction = function


func _on_Button_pressed():
	visible = false
	if btnFunction == 1:
		pass
		#bring budget
