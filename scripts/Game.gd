extends Control

export var score = 0
export var money = 1
export var getmoney = 0
var combo = 0

var shop_delay = 0
var shop = false

func _on_Timer_timeout():
	score += getmoney

func _process(_delta):
	$Score.text = str(score)
	
	if shop_delay > 0:
		shop_delay -= 1


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

func _on_Shop_pressed():
	if shop == false and shop_delay ==0:
		shop = true
		shop_delay = 20
		$AnimationShop.play("shop")
		$AnimationShop.play("TheShop")
	if shop == true and shop_delay ==0:
		shop = false
		shop_delay = 20
		$AnimationClose.play("shop")
		$AnimationClose.play("TheShop")
	
