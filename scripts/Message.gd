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
	if function == 2:
		get_parent().time_activate = false


func _on_Button_pressed():
	visible = false
	if btnFunction == 1:
		get_parent().get_node("budget").budget()
		#bring budget
	if btnFunction == 2:
		message("Housing","You can also use the money in your saving account to buy a better home. A better home means an increase in capacity meaning more item meaning more money. However be careful as it will dramatically increase the cost of living.", 3)
	if btnFunction == 3:
		get_parent().time_activate = true
