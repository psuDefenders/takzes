extends Node2D

var btnFunction = 0
var percent = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if percent < 1:
		percent += 0.02
	$message.percent_visible = percent

func message(title, body, function):
	percent = 0
	visible = true
	$message.text = body
	$title.text = title
	btnFunction = function


func _on_Button_pressed():
	visible = false
	if btnFunction == 1:
		get_parent().get_node("budget").budget()
		#bring budget
