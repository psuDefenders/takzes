extends Control




func _on_Close_pressed():
	get_tree().get_root().get_node("Control").mail = false
	get_tree().get_root().get_node("Control/TheMail").visible = false

func _process(_delta):
	if get_tree().get_root().get_node("Control/TheMail").visible == true:
		if get_tree().get_root().get_node("Control").mail_count == 0:
			$VBoxContainer/Mail1.visible = false
			$VBoxContainer/Mail2.visible = false
			$VBoxContainer/Mail3.visible = false
			$VBoxContainer/Mail4.visible = false
			$VBoxContainer/Mail5.visible = false
			$VBoxContainer/Mail6.visible = false
			$VBoxContainer/Mail7.visible = false
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 1:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = false
			$VBoxContainer/Mail3.visible = false
			$VBoxContainer/Mail4.visible = false
			$VBoxContainer/Mail5.visible = false
			$VBoxContainer/Mail6.visible = false
			$VBoxContainer/Mail7.visible = false
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 2:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = false
			$VBoxContainer/Mail4.visible = false
			$VBoxContainer/Mail5.visible = false
			$VBoxContainer/Mail6.visible = false
			$VBoxContainer/Mail7.visible = false
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 3:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = false
			$VBoxContainer/Mail5.visible = false
			$VBoxContainer/Mail6.visible = false
			$VBoxContainer/Mail7.visible = false
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 4:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = true
			$VBoxContainer/Mail5.visible = false
			$VBoxContainer/Mail6.visible = false
			$VBoxContainer/Mail7.visible = false
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 5:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = true
			$VBoxContainer/Mail5.visible = true
			$VBoxContainer/Mail6.visible = false
			$VBoxContainer/Mail7.visible = false
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 6:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = true
			$VBoxContainer/Mail5.visible = true
			$VBoxContainer/Mail6.visible = true
			$VBoxContainer/Mail7.visible = false
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 7:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = true
			$VBoxContainer/Mail5.visible = true
			$VBoxContainer/Mail6.visible = true
			$VBoxContainer/Mail7.visible = true
			$VBoxContainer/Mail8.visible = false
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 8:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = true
			$VBoxContainer/Mail5.visible = true
			$VBoxContainer/Mail6.visible = true
			$VBoxContainer/Mail7.visible = true
			$VBoxContainer/Mail8.visible = true
			$VBoxContainer/Mail9.visible = false
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 9:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = true
			$VBoxContainer/Mail5.visible = true
			$VBoxContainer/Mail6.visible = true
			$VBoxContainer/Mail7.visible = true
			$VBoxContainer/Mail8.visible = true
			$VBoxContainer/Mail9.visible = true
			$VBoxContainer/Mail10.visible = false
		elif get_tree().get_root().get_node("Control").mail_count == 10:
			$VBoxContainer/Mail1.visible = true
			$VBoxContainer/Mail2.visible = true
			$VBoxContainer/Mail3.visible = true
			$VBoxContainer/Mail4.visible = true
			$VBoxContainer/Mail5.visible = true
			$VBoxContainer/Mail6.visible = true
			$VBoxContainer/Mail7.visible = true
			$VBoxContainer/Mail8.visible = true
			$VBoxContainer/Mail9.visible = true
			$VBoxContainer/Mail10.visible = true
