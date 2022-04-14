extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$curLiveCost.text = "Current living expense: " + str(Global.livingExpense)


func budget():
	$curLiveCost.text = "Current living expense: " + str(Global.livingExpense)
	visible = true
