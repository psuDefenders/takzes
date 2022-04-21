extends Node2D


export var fadein = false


func _ready():
	if fadein == true:
		$AnimationPlayer.play("fadein")
	else:
		$AnimationPlayer.play("fadeout")




func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadein":
		queue_free()
	elif anim_name == "fadeout":
		get_parent().transition_end()
