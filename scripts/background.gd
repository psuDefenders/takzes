extends Node2D


var speed = 1
onready var sprite = $Sprite
onready var sprite2 = $Sprite2


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if sprite.global_position.x <=3240:
		sprite.global_position.x += speed
	if sprite.global_position.y < 1620:
		sprite.global_position.y += speed
	

	if sprite.global_position.x >= 3240:
		sprite.global_position.x = -1320
	if sprite.global_position.y >= 1620:
		sprite.global_position.y = -540
		
	
	if sprite2.global_position.x > -1320:
		sprite2.global_position.x -= speed
	if sprite2.global_position.x <= -1320:
		sprite2.global_position.x = 3181
