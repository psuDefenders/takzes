extends Control

var score = 0
var money = 1
var getmoney = 1
var combo = 0


func _on_Timer_timeout():
	score += getmoney

func _process(_delta):
	$Score.text = str(score)


func _on_Click_pressed():
	$ClickTimer.start()
	if combo < 100:
		combo += 1
	if combo > 25:
		score += round(money * (combo / 25))
		$ComboEffect.emitting = true
	if combo <= 25:
		score += money


func _on_ClickTimer_timeout():
	combo = 0
	$ComboEffect.emitting = false # Effects
