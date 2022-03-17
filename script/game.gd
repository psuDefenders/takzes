extends Node

var score = 0
var add = 1
var addpersec = 1
var combo = 0

func _process(_delta):
	$Score.text = str(score)

#func bouttonvnb ():
#	score += add
	
func _on_Button_pressed():
	score += add
