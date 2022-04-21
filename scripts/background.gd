extends Node2D


var speed = 1
onready var sprite = $Sprite


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if sprite.global_position.x < 3240:
		sprite.global_position.x += speed
	if sprite.global_position.y < 1620:
		sprite.global_position.y += speed
	
	
	
	
	if sprite.global_position.x >= 3240:
		sprite.global_position.x = -1320
	if sprite.global_position.y >= 1620:
		sprite.global_position.y = -540
