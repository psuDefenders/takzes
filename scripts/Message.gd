extends Node2D


func _ready():
	pass # Replace with function body.


func message(title, body, function):
	visible = true
	$message.text = body
	$title.text = title


func _on_Button_pressed():
	visible = false
